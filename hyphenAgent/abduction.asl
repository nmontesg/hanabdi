// ABD(T_{i,j,...,k,l}, S, a_l) obtains the set of abducible atoms from 
// T_{i,j,...,k} \models abducible(F).

abducible(has_card_color(Me, Slot, Color)) :-
    my_name(Me) & slot(Slot) & color(Color) &
    not has_card_color(Me, Slot, _) &
    not ~has_card_color(Me, Slot, Color).

abducible(has_card_rank(Me, Slot, Rank)) :-
    my_name(Me) & slot(Slot) & rank(Rank) &
    not has_card_rank(Me, Slot, _) &
    not ~has_card_rank(Me, Slot, Rank).

// integrity constraints

ic :-
    player(P) & slot(S) & color(C1) & color(C2) & C1 \== C2 &
    has_card_color(P, S, C1) & has_card_color(P, S, C2).

ic :-
    player(P) & slot(S) & rank(R1) & rank(R2) & R1 \== R2 &
    has_card_rank(P, S, R1) & has_card_rank(P, S, R2).

ic :-
    player(P) & slot(S) & color(C) &
    has_card_color(P, S, C) & ~has_card_color(P, S, C).

ic :-
    player(P) & slot(S) & rank(R) &
    has_card_rank(P, S, R) & ~has_card_rank(P, S, R).

// abduction
@kqmlReceivedAbduction[atomic]
+!kqml_received(KQML_Sender_Var, abduce, Action, KQML_MsgId) : true
    <- .print("I received the abduce command");
    // get the abducible atoms
    .findall(Phi, abducible(Phi), Abducibles);
    !adopt_perspective([KQML_Sender_Var]);
    for ( .member(A, Abducibles) ) { +abducible(A); }
    .findall(Plan, .relevant_plan({+?select_action(Action)}, Plan), LP);

    for ( .member(P, LP) ) {
        custom.get_plan_title(P, Title);
        if ( not abduced(_, _, Title, _) ) {
            custom.get_plan_context(P, Context);
            .findall(Delta, abduce(Context, [], Delta), LExpl);
            //.print(P, "\n", Context, "\n", LExpl, "\n", Title, "\n");
            .length(LExpl, N);
            if ( N > 0 ) { +abduced(Action, KQML_Sender_Var, Title, LExpl); }
        }
    }

    // save the abduced explanations in a list and recover my original BB
    .findall(
        abduced(Action, KQML_Sender_Var, Title, LExpl),
        abduced(Action, KQML_Sender_Var, Title, LExpl),
        AllAbd
    );
    custom.remove_beliefs;
    custom.recover_beliefs;   
    !refine_abduced_explanations(AllAbd).


@refineAbducedExplanations[atomic]
+!refine_abduced_explanations(L) : true
    <- .print(L);
    for ( .member(abduced(_, _, _, LExpl), L) ) {
        for ( .member(Exp, LExpl) ) {
            .print(Exp);
            // Check if the explanation is compatible with the integrity constraints
            for ( .member(Fact, Exp) ) { +Fact; }
            if ( ic ) {
                .print("Explanation ", Exp, " is inconsistent with the ICs");
                true;
            } else {
                .print("Explanation ", Exp, " is OK");
            }
            for ( .member(Fact, Exp) ) { -Fact; }
        }
    }.

// NOTE important difference:
// If LExpl --> [ [] ], it means that the plan being considered (that would result
// in selecting the observed action) is consistent with the current BB (aka the
// one that has been adopted by taking the perspective of the other agent).
// However, it does not provide any additional information.
// 
// If LExpl --> [], it means that the plan being considered is not compatible
// with the BB (from the perspective of the other), and hence it could not
// have been selected in the first place.

abduce(Goal1 & Goal2, Delta0, Delta) :-
    custom.conjunction(Goal1 & Goal2) &
    abduce(Goal1, Delta0, Delta1) &
    abduce(Goal2, Delta1, Delta).

abduce(Goal, Delta, Delta) :-
    not custom.conjunction(Goal) & Goal.

abduce(Goal, Delta, Delta) :-
    not custom.conjunction(Goal) & not Goal &
    abducible(Goal) & .member(Goal, Delta).

abduce(Goal, Delta, [Goal|Delta]) :-
    not custom.conjunction(Goal) & not Goal &
    abducible(Goal) & not .member(Goal, Delta).

abduce(Goal, Delta0, Delta) :-
    not custom.conjunction(Goal) & not Goal & not abducible(Goal) &
    .relevant_rules(Goal, RL) & .length(RL, N) & N > 0 &
    .member(R, RL) &
    custom.unify_goal_rule(Goal, R, UnifiedR) & 
    custom.get_rule_body(UnifiedR, Body) &
    abduce(Body, Delta0, Delta).
