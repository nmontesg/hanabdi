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

// integrity constraints: I think integrty constraints are not necessary
// because we have already stated that facts are only abducible if the agent
// know the color (rank) of a slot, and if they do not know for sure that
// they do not have that color (rank) in the slot.

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
    <- // get the abducible atoms
    .print("I received the abduce command");
    .findall(Phi, abducible(Phi), Abducibles);
    !adopt_perspective([KQML_Sender_Var]);
    for ( .member(A, Abducibles) ) { +abducible(A); }
    .findall(Plan, .relevant_plan({+?select_action(Action)}, Plan), LP);
    for ( .member(P, LP) ) {
        custom.switch_abduction_mode;
        .print(P);
        custom.get_plan_context(P, Context);
        .print(Context);
        !abduce(Context, [], Delta);
    }.

@abduction1[atomic]
+!abduce(Goal1 & Goal2, Delta0, Delta) : true
    <- .print("Abducing conjunction of goals:");
    .print("    LHS: ", Goal1);
    .print("    RHS: ", Goal2);
    .print("Delta0: ", Delta0);
    !abduce(Goal1, Delta0, Delta1);
    !abduce(Goal2, Delta1, Delta). 

@abduction2[atomic, all_unifs]
+!abduce(Goal, Delta, Delta) : Goal
    <- .print("Abducing goal ", Goal, ", which is derived from the BB");
    .print("Delta0: ", Delta).

@abduction3[atomic, all_unifs]
+!abduce(Goal, Delta, Delta) : abducible(Goal) & .member(Goal, Delta)
    <- .print("Abducing goal ", Goal, ", which has already been abduced");
    .print("Delta: ", Delta).

@abduction4[atomic, all_unifs]
+!abduce(Goal, Delta, [Goal|Delta]) : abducible(Goal) & not .member(Goal, Delta)
    <- .print("Abducing goal ", Goal, ", which is an abducible atom");
    .print("Delta0: ", Delta, " --> Delta: ", [Goal|Delta]).

@abduction5[atomic, all_unifs]
+!abduce(Goal, Delta0, Delta) : not Goal & .relevant_rules(Goal, LR) & .member(Rule, LR)
    <- .print("Abducing goal ", Goal, ", which is not derived from the BB but has relevant rule ", Rule);
    .print("Delta0: ", Delta0);
    // The retrieved relevant rule has to be transformed so as to have variables
    // instantiated to the head and the goal
    custom.unify_rule_body(Goal, Rule, UnifRule);
    custom.get_rule_body(UnifRule, Body);
    .print(UnifRule);
    !abduce(Body, Delta0, Delta).

@abduction6[atomic, all_unifs]
+!abduce(Goal, _, []) : .ground(Goal) & not Goal
    <- .print("Abducing goal ", Goal, ", which is false.").

// This should change a little bit:
// if there are still applicable plans to prove a goal, try them
// if there are no more plans to prove a goal, drop it
/*
-!abduce(Goal, Delta0, Delta) : true
    <- .print("catching failure of goal ", Goal).
*/
