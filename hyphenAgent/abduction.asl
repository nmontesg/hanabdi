/* -------- PUBLIC ACTIONS -------- */

@kqmlReceivedPublicAction1[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, play_card(Slot), KQML_MsgId) : true
    <- !abduce(KQML_Sender_Var, play_card(Slot)).

@kqmlReceivedPublicAction2[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, discard_card(Slot), KQML_MsgId) : true
    <- !abduce(KQML_Sender_Var, discard_card(Slot)).

@kqmlReceivedPublicAction3[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, hint(Id, KQML_Sender_Var, ToPlayer, Mode, Value, Slots), KQML_MsgId) : true
    <- +hint(Id, KQML_Sender_Var, ToPlayer, Mode, Value, Slots);
    // first update explicit informatio conveyed by the hint before abducing
    .concat("has_card_", Mode, String);
    .term2string(Term, String);
    ?cards_per_player(N);
    for ( .range(S, 1, N) ) {
        Belief =.. [Term, [ToPlayer, S, Value], [source(hint), hint_id(Id)]];
        if ( .member(S, Slots) ) {
            +Belief;
        } else {
            +(~Belief);
        }
    }
    !abduce(KQML_Sender_Var, give_hint(ToPlayer, Mode, Value)).



/* -------- ABDUCIBLE ATOMS -------- */

abducible(has_card_color(Me, Slot, Color)) :-
    my_name(Me) & slot(Slot) & color(Color) &
    not has_card_color(Me, Slot, _) &
    not ~has_card_color(Me, Slot, Color).

abducible(has_card_rank(Me, Slot, Rank)) :-
    my_name(Me) & slot(Slot) & rank(Rank) &
    not has_card_rank(Me, Slot, _) &
    not ~has_card_rank(Me, Slot, Rank).


/* -------- INTEGRITY CONSTRAINTS -------- */

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
    custom.decompose_rule(UnifiedR, _, Body) &
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
    <- // .print("I received the abduce command");
    // get the abducible atoms
    // .findall(Phi, abducible(Phi), Abducibles);
    !adopt_perspective([Player]);
    // for ( .member(A, Abducibles) ) { +abducible(A); }
    .findall(Plan, .relevant_plan({+?select_action(Action)}, Plan), LP);
    for ( .member(P, LP) ) {
        custom.get_plan_title(P, Title);
        if ( not abduced(_, _, Title, _) ) {
            custom.get_plan_context(P, Context);
            .findall(Delta, abduce(Context, [], Delta), LExpl);
            .print(P, "\n\n", Title, "\n\n", Context, "\n\n", LExpl, "\n\n");
            .length(LExpl, N);
            if ( N > 0 ) { +abduced(Action, Player, Title, LExpl); }
        }
    }
    // save the abduced explanations in a list and recover my original BB
    .findall(
        abduced(Action, Player, Title, LExpl),
        abduced(Action, Player, Title, LExpl),
        AllAbd
    );
    custom.remove_beliefs;
    custom.recover_beliefs;   
    !refine_abduced_explanations(AllAbd);
    .send(Player, tell, finished_abduction).


@refineAbducedExplanations[atomic]
+!refine_abduced_explanations(L) : true
    <- .print(L, "\n");
    for ( .member(abduced(_, _, _, LExpl), L) ) {
        for ( .member(Exp, LExpl) ) {
            // Check if the explanation is compatible with the integrity constraints
            for ( .member(Fact, Exp) ) { +Fact; }
            if ( ic ) {
                .print("Explanation ", Exp, " is inconsistent with the ICs");
            } else {
                .print("Explanation ", Exp, " is OK");
            }
            for ( .member(Fact, Exp) ) { -Fact; }
        }
    }.
