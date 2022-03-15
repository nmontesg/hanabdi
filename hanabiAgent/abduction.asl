/* -------- PUBLIC ACTIONS -------- */

@kqmlReceivedPublicAction1[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, play_card(Slot), KQML_MsgId) : true
    <- !abduce(KQML_Sender_Var, play_card(Slot));
    .send(KQML_Sender_Var, tell, finished_abduction).
    
@kqmlReceivedPublicAction2[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, discard_card(Slot), KQML_MsgId) : true
    <- !abduce(KQML_Sender_Var, discard_card(Slot));
    .send(KQML_Sender_Var, tell, finished_abduction).
    
@kqmlReceivedPublicAction3[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, give_hint(HintedPlayer, Mode, Value, SlotList), KQML_MsgId) : true
    <- ?hint_id(Id);
    +hint(Id, KQML_Sender_Var, HintedPlayer, Mode, Value, SlotList);
    // first update explicit information conveyed by the hint before abducing
    .concat("has_card_", Mode, String);
    .term2string(Term, String);
    ?cards_per_player(N);
    for ( .range(S, 1, N) ) {
        Belief =.. [Term, [HintedPlayer, S, Value], [source(hint), hint_id(Id)]];
        if ( .member(S, SlotList) ) { +Belief; } else { +(~Belief); }
    }
    !abduce(KQML_Sender_Var, give_hint(HintedPlayer, Mode, Value));
    .send(KQML_Sender_Var, tell, finished_abduction).
    

/* -------- ABDUCIBLE ATOMS -------- */

abducible(has_card_color(Player, Slot, C1)) :-
    player(Player) & slot(Slot) & color(C1) & color(C2) & C2 \== C1 &
    logic_program(LPs) & .member(Player, LPs) &
    not has_card_color(Player, Slot, C2) & 
    not ~has_card_color(Player, Slot, C1).

abducible(has_card_rank(Player, Slot, R1)) :-
    player(Player) & slot(Slot) & rank(R1) & rank(R2) & R1 \== R2 &
    logic_program(LPs) & .member(Player, LPs) &
    not has_card_rank(Player, Slot, R2) & 
    not ~has_card_rank(Player, Slot, R1).


/* -------- INTEGRITY CONSTRAINTS -------- */

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

// An agent can only have a card of Color and Rank at any
// Slot of their holder if the number of cards of that Color and Rank that have
// been disclosed to the agent everywhere EXCEPT that Slot do not add up to the
// total number of cards of Rank

ic :-
    player(P) & slot(S) & color(C) & rank(R) &
    has_card_color(P, S, C) & has_card_rank(P, S, R) &
    disclosed_cards(C, R, P, S, N) & cards_per_rank(R, N).


/* -------- ABDUCTIVE REASONING RULES -------- */

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
    custom.rule_head_body(UnifiedR, _, Body) &
    abduce(Body, Delta0, Delta).


/* -------- ABDUCTIVE REASONING STEPS -------- */

// NOTE important difference:

// If LExpl --> [ [] ], it means that the plan being considered (that would result
// in selecting the observed action) is consistent with the current BB (aka the
// one that has been adopted by taking the perspective of the other agent).
// However, it does not provide any additional information.

// If LExpl --> [], it means that the plan being considered is not compatible
// with the BB (from the perspective of the other), and hence it could not
// have been selected in the first place.

@abduction[atomic]
+!abduce(Player, Action) : true
    <- custom.backup_beliefs;
    !adopt_perspective([Player]);
    .findall(Plan, .relevant_plan({+? action(Action)}, Plan), LP);
    for ( .member(P, LP) ) {
        custom.decompose_plan(P, _, _, Context, _);
        .findall(Delta, abduce(Context, [], Delta), LExpl);
        //.print(P, "\n\n", Context, "\n\n", LExpl, "\n\n");
        .length(LExpl, N);
        for ( .member(Expl, LExpl) ) { +abduced(Expl); }
    }
    // save the abduced explanations in a list and recover my original BB
    .findall(E, abduced(E), AllAbdExpl);
    custom.remove_beliefs;
    custom.recover_beliefs;
    !refine_abduced_explanations(AllAbdExpl).


@refineAbducedExplanations1[atomic]
+!refine_abduced_explanations(L) : .length(L, N) & N > 0
    <- for ( .member(Exp, L) ) {
        // Check if the explanation is compatible with the integrity constraints
        for ( .member(Fact, Exp) ) { +Fact; }
        if ( not ic ) {
            .print("Explanation ", Exp, " is OK");
            if ( .length(Exp, M) & M > 0 ) {
                custom.list2conjunction(Exp, 0, Conj);
                +abduced_explanation(Conj);
            }
        }
        for ( .member(Fact, Exp) ) { -Fact; }
    }
    .findall(C, abduced_explanation(C), ListConj);
    if ( .length(ListConj, NumConj) & NumConj > 0 ) {
        custom.list2conjunction(ListConj, 1, AbducedExpl);
        ?abd_id(Id);
        custom.rule_head_body(NewIC, ic [source(abduction), abd_id(Id)], AbducedExpl);
        .print(NewIC);
        +NewIC;
        -+abd_id(Id+1);
    }
    .abolish(abduced_explanation(_)).

@refineAbducedExplanations2[atomic]
+!refine_abduced_explanations(L) : .length(L, 0)
    <- .print("no explanations to refine").
