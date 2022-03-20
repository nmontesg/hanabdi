// Plan library to select the action to take in the game according to the
// strategy the agent is following, using ``possible worlds reasoning''.

@actInTheGame[atomic]
+player_turn(Me) : .my_name(Me)
    <- -+finished_abduction(0);
    !select_action;
    ?my_action(Action);
    .log(info, Action);
    !share_public_action(Action).

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
    // find potential (partial) instantiations for action selection plan
    .setof(F, partially_instantiate(Context, [], F), SkolemInsts);
    for ( .member(PartialInst, SkolemInsts) ) { !evaluate_partial_instantiation(PartialInst); }.

@evaluatePartialInst1[atomic]
+!evaluate_partial_instantiation(Skolem) : .length(Skolem, N) & N > 0
    <- .findall(W, potential_instantation(Skolem, W), Worlds);
    .abolish(selected_action(_, _));
    for ( .member(W, Worlds) ) {
        for ( .member(Fact, W) ) { +Fact [temp]; }
        if ( not ic ) {
            ?action(A);
            +selected_action(W, A);
        }
        for ( .member(Fact, W) ) { -Fact [temp]; }
    }
    .setof(Act, selected_action(_, Act), SelectedActions);
    .abolish(selected_action(_, _));
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
    custom.expr_operator(LHS & RHS, and) &
    partially_instantiate(LHS, Unknowns, Unknowns1) &
    partially_instantiate(RHS, Unknowns1, NewUnknowns).

partially_instantiate(LHS | RHS, Unknowns, NewUnknowns) :-
    custom.expr_operator(LHS | RHS, or) &
    (partially_instantiate(LHS, Unknowns, NewUnknowns) |
    partially_instantiate(RHS, Unknowns, NewUnknowns)).

partially_instantiate(Literal, Unknowns, Unknowns) :-
    not custom.expr_operator(Literal, _) & Literal.

partially_instantiate(Literal, Unknowns, NewUnknowns) :-
    not custom.expr_operator(Literal, _) & not Literal & not unknown(Literal) &
    .relevant_rules(Literal, RL) & .length(RL, N) & N > 0 & .member(R, RL) &
    custom.unify_goal_rule(Literal, R, UnifiedR) & 
    custom.rule_head_body(UnifiedR, _, Body) &
    partially_instantiate(Body, Unknowns, NewUnknowns).

partially_instantiate(Literal, Unknowns, Unknowns) :-
    not custom.expr_operator(Literal, _) & not Literal &
    unknown(Literal) & .member(Literal, Unknowns).

partially_instantiate(Literal, Unknowns, [SkolemLiteral|Unknowns]) :-
    not custom.expr_operator(Literal, _) & not Literal &
    unknown(Literal) & not .member(Literal, Unknowns) &
    skolemize(Literal, SkolemLiteral).
