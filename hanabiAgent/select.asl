// Plan library to select the action to take in the game according to the
// strategy the agent is following, using ``possible worlds reasoning''.

@actInTheGame[atomic]
+player_turn(Me) : .my_name(Me) //& .member(Me, [alice, bob]) //& my_turns(Turns) & Turns < 1
    <- -+finished_abduction(0);
    !select_action;
    ?my_action(Action) [Annots];
    .log(info, Action [Annots], "\n");
    .broadcast(publicAction, Action).


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
    <- custom.decompose_plan(Plan, Label, {+?action(Action)}, Context, _);
    Label =.. [PlanTitle, _, _];
    -+plan_under_evaluation(PlanTitle);

    // find potential (partial) instantiations for action selection plan
    .setof(F, partially_instantiate(Context, [], F), SkolemInsts);

    // check what action do each of the complete possible instantiations of the
    // partial instantiation lead to
    for ( .member(PartialInst, SkolemInsts) ) {
        !evaluate_partial_instantiation(PartialInst, Action);
    }.


@evaluatePartialInst1[atomic]
+!evaluate_partial_instantiation(PartialInst, ActionToMatch) : .length(PartialInst, N) & N > 0
    <- // 1. Find the set of complete possible instantiations from the
    // partial instantiation
    .setof(W, potential_instantation(PartialInst, W), Worlds);

    // 2. For every possible total instantiation, check if it is compatible
    // with the ICs and what action it leads to
    for ( .member(W, Worlds) ) {
        for ( .member(Fact, W) ) { +Fact [source(eval)]; }
        if ( not ic ) {
            ?action(A);
            +selected_action(W, A);
        }
        for ( .member(Fact, W) ) { -Fact [source(eval)]; }
    }

    .setof(A, selected_action(_, A), SelectedActions);
    .abolish(selected_action(_, _));

    // 3. If all the possible total instantiations lead to the same action, 
    // select it
    if ( .length(SelectedActions, 1) & SelectedActions = [Action] & Action = ActionToMatch) {
        // SelectedActions = [Action];
        ?plan_under_evaluation(PlanTitle);
        -+my_action(Action) [plan(PlanTitle)];
        .succeed_goal(select_action);
    }.


@evaluatePartialInst2[atomic]
+!evaluate_partial_instantiation([], ActionToMatch) : true
    <- ?action(Action);
    ?plan_under_evaluation(PlanTitle);
    -+my_action(Action) [plan(PlanTitle)];
    .succeed_goal(select_action).


/* ------------------------------------------------------------------------- */


unknown(has_card_color(Me, Slot, Color) [source(percept)]) :- my_name(Me) & slot(Slot) & color(Color).
unknown(has_card_rank(Me, Slot, Rank) [source(percept)]) :- my_name(Me) & slot(Slot) & rank(Rank).

skolemize(has_card_color(P, S, C), has_card_color(P, S, free)) :- color(C).
skolemize(has_card_rank(P, S, R), has_card_rank(P, S, free)) :- rank(R).

potential_instantation([], []).
potential_instantation([H|T], [NewH|NewT]) :-
    skolemize(NewH, H) &
    potential_instantation(T, NewT).

partially_instantiate(LHS & RHS, Unknowns, NewUnknowns) :-
    custom.expr_operator(LHS & RHS, "and") &
    partially_instantiate(LHS, Unknowns, Unknowns1) &
    partially_instantiate(RHS, Unknowns1, NewUnknowns).

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
