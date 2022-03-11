// Plan library to select the action to take in the game according to the
// strategy the agent is following, using ``possible worlds reasoning''.

@actInTheGame[atomic]
+player_turn(Me) : .my_name(Me) & turn_number(Me, 1) & logic_program([Me])
    <- -+finished_abduction(0);
    !select_action;
    .abolish(selected_action(_, _));
    ?my_action(Action);
    .print("selected action ", Action).

@sharePublicAction1[atomic]
+!share_public_action(play_card(Slot)) : true
    <- .broadcast(publicAction, play_card(Slot)).

@sharePublicAction2[atomic]
+!share_public_action(discard_card(Slot)) : true
    <- .broadcast(publicAction, discard_card(Slot)).

@sharePublicAction3[atomic]
+!share_public_action(give_hint(HintedPlayer, Mode, Value)) : true
    <- .concat("has_card_", Mode, String);
    .term2string(Term, String);
    Query =.. [Term, [HintedPlayer, S, Value], [source(percept)]];
    .findall(S, Query, SlotList);
    .broadcast(publicAction, give_hint(HintedPlayer, Mode, Value, SlotList)).

@selectAction[atomic]
+!select_action : true
    <- -+my_action(none);
    .findall(P, .relevant_plan({+?action(Action)}, P), LP);
    custom.sort_by_priority(LP, SortedLP);
    .length(SortedLP, Length);
    for ( .range(I, 0, Length-1) ) {
        .nth(I, SortedLP, Plan);
        !evaluate_plan(Plan);
    }.

@evaluatePlan[atomic]
+!evaluate_plan(Plan) : true
    <- custom.decompose_plan(Plan, _, _, Context, _);
    .print(Plan);
    .print(Context, "\n");
    // find potential (partial) instantiations for action selection plan
    .setof(F, partially_instantiate(Context, [], F), SkolemInsts);
    // .print("missing literals that would lead to a full instantiation of the plan:");
    // !print_list(SkolemInsts);
    for ( .member(PartialInst, SkolemInsts) ) { !evaluate_partial_instantiation(PartialInst); }.
    // .print("----------------------------------------------------------------------\n\n").

@evaluatePartialInst1[atomic]
+!evaluate_partial_instantiation(Skolem) : .length(Skolem, N) & N > 0
    <- .findall(W, potential_instantation(Skolem, W), Worlds);
    // .print("potential instantiations of ", Skolem, ":");
    // !print_list(Worlds);
    for ( .member(W, Worlds) ) {
        for ( .member(Fact, W) ) { +Fact [temp]; }
        if ( not ic ) {
            ?action(A);
            +selected_action(W, A);
            // .print("instantiation ", W, " leads to action ", A);
        }
        // else {
        //     .print("instantiation ", W, " is not compatible with the ICs");
        // }
        for ( .member(Fact, W) ) { -Fact [temp]; }
    }
    .setof(Act, selected_action(_, Act), SelectedActions);
    if ( .length(SelectedActions, 1) ) {
        .nth(0, SelectedActions, FinalAction);
        -+my_action(FinalAction);
        .succeed_goal(select_action);
    }.

@evaluatePartialInst2[atomic]
+!evaluate_partial_instantiation([]) : true
    <- ?action(A);
    -+my_action(A);
    .succeed_goal(select_action).

unknown(has_card_color(Me, Slot, Color)) :- my_name(Me) & slot(Slot) & color(Color).
unknown(has_card_rank(Me, Slot, Rank)) :- my_name(Me) & slot(Slot) & rank(Rank).

skolemize(has_card_color(P, S, C), has_card_color(P, S, free)) :- color(C).
skolemize(has_card_rank(P, S, R), has_card_rank(P, S, free)) :- rank(R).

potential_instantation([], []).
potential_instantation([H|T], [NewH|NewT]) :-
    skolemize(NewH, H) &
    potential_instantation(T, NewT).

partially_instantiate(LHS & RHS, Unknowns, NewUnknowns) :-
    custom.conjunction(LHS & RHS) &
    partially_instantiate(LHS, Unknowns, Unknowns1) &
    partially_instantiate(RHS, Unknowns1, NewUnknowns).

partially_instantiate(Literal, Unknowns, Unknowns) :-
    not custom.conjunction(Literal) & Literal.

partially_instantiate(Literal, Unknowns, NewUnknowns) :-
    not custom.conjunction(Literal) & not Literal & not unknown(Literal) &
    .relevant_rules(Literal, RL) & .length(RL, N) & N > 0 & .member(R, RL) &
    custom.unify_goal_rule(Literal, R, UnifiedR) & 
    custom.decompose_rule(UnifiedR, _, Body) &
    partially_instantiate(Body, Unknowns, NewUnknowns).

partially_instantiate(Literal, Unknowns, Unknowns) :-
    not custom.conjunction(Literal) & not Literal &
    unknown(Literal) & .member(Literal, Unknowns).

partially_instantiate(Literal, Unknowns, [SkolemLiteral|Unknowns]) :-
    not custom.conjunction(Literal) & not Literal &
    unknown(Literal) & not .member(Literal, Unknowns) &
    skolemize(Literal, SkolemLiteral).