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
    player(Player) & logic_program(CurrentLP) & .member(Player, CurrentLP) &
    slot(Slot) & color(C1) & color(C2) & C2 \== C1 &
    not has_card_color(Player, Slot, C2) & 
    not ~has_card_color(Player, Slot, C1).

abducible(has_card_rank(Player, Slot, R1)) :-
    player(Player) & logic_program(CurrentLP) & .member(Player, LPs) &
    slot(Slot) & rank(R1) & rank(R2) & R1 \== R2 &
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
    custom.expr_operator(Goal1 & Goal2, and) &
    abduce(Goal1, Delta0, Delta1) &
    abduce(Goal2, Delta1, Delta).

abduce(Goal1 | Goal2, Delta0, Delta) :-
    custom.expr_operator(Goal1 | Goal2, or) &
    (abduce(Goal1, Delta0, Delta) |
    abduce(Goal2, Delta0, Delta)).

abduce(Goal, Delta, Delta) :-
    not custom.expr_operator(Goal, _) & Goal.

abduce(Goal, Delta, Delta) :-
    not custom.expr_operator(Goal, _) & not Goal &
    abducible(Goal) & .member(Goal, Delta).

abduce(Goal, Delta, [Goal|Delta]) :-
    not custom.expr_operator(Goal, _) & not Goal &
    abducible(Goal) & not .member(Goal, Delta).

abduce(Goal, Delta0, Delta) :-
    not custom.expr_operator(Goal, _) & not Goal & not abducible(Goal) &
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
    <- hanabiAgent.backup_beliefs;
    !adopt_perspective([Player]);
    .findall(Plan, .relevant_plan({+? action(Action)}, Plan), LP);
    for ( .member(P, LP) ) {
        custom.decompose_plan(P, _, _, Context, _);
        .setof(Delta, abduce(Context, [], Delta), LExpl);
        for ( .member(Expl, LExpl) ) { 
            if ( .length(Expl, N) & N > 0) { +abductive_explanation(Expl); }
        }
    }
    // save the abduced explanations in a list and recover my original BB
    .findall(E, abductive_explanation(E), AllAbdExpl);
    hanabiAgent.remove_beliefs;
    hanabiAgent.recover_beliefs;
    !refine_abduced_explanations(AllAbdExpl).


@refineAbducedExplanations1[atomic]
+!refine_abduced_explanations(L) : .length(L, N) & N > 0
    <- for ( .member(Exp, L) ) { !validate_explanation(Exp); }
    .findall(E, valid_explanation(E), ListValidExpls);
    .findall(NE, negated_explanation(NE), ListNegExpls);
    if ( .length(ListValidExpls, V) & V > 0 ) {
        custom.list2formula(ListValidExpls, 0, "or", DNF);
        custom.list2formula(ListNegExpls, 0, "and", NegDNF);
        ?abd_id(Id);
        +abduction_explanation(DNF) [source(abduction), abd_id(Id)];
        custom.rule_head_body(NewIC, ic [source(abduction), abd_id(Id)], NegDNF);
        +NewIC;
        -+abd_id(Id+1);
    }
    .abolish(valid_explanation(_));
    .abolish(negated_explanation(_)).


@refineAbducedExplanations2[atomic]
+!refine_abduced_explanations(L) : .length(L, 0).


@validateExplanation[atomic]
+!validate_explanation(Exp) : true
    <- custom.list2formula(Exp, 0, "and", Conj);
    // check that the explanation is *informative*, i.e. cannot be derived from the BB
    if ( not Conj ) {
        // check that the explanation is consistent with the ICs
        for ( .member(Fact, Exp) ) { +Fact; }
        if ( not ic ) {
            custom.list2formula(Exp, 1, "or", NegConj);
            +valid_explanation(Conj);
            +negated_explanation(NegConj);
        }
        for ( .member(Fact, Exp) ) { -Fact; }
    }.

// update the abduction explanations when the player plays or discards a card
// and comes to know of its color and rank

@updateExplanations[atomic]
+!update_abduction_explanations(Slot, Color, Rank) : my_name(Me)
    <- +has_card_color(Me, Slot, Color) [temp];
    +has_card_rank(Me, Slot, Color) [temp];
    .findall(
        abduction_explanation(DNF) [source(abduction), abd_id(Id)],
        abduction_explanation(DNF) [source(abduction), abd_id(Id)],
        Explanations
    );
    for ( .member(abduction_explanation(DNF) [source(abduction), abd_id(Id)], Explanations) ) {
        if ( DNF ) {
            -abduction_explanation(DNF) [source(abduction), abd_id(Id)];
            .relevant_rules(ic [source(abduction), abd_id(Id)], [IC]);
            -IC;
        }
    }
    -has_card_color(Me, Slot, Color) [temp];
    -has_card_rank(Me, Slot, Rank) [temp].
