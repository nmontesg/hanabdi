/* ---------------------------- PUBLIC ACTIONS ---------------------------- */

@kqmlReceivedPublicAction[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, Action, KQML_MsgId) : true
    <-   if ( Action = give_hint(HintedPlayer, Mode, Value, SlotList) ) { 
        ?hint_id(Id);
        +hint(Id, KQML_Sender_Var, HintedPlayer, Mode, Value, SlotList);
    }
    !abduce(KQML_Sender_Var, Action);
    .send(KQML_Sender_Var, tell, finished_abduction).



/* ---------------------------- ABDUCIBLE ATOMS ---------------------------- */

abducible(has_card_color(Player, Slot, C1)) :-
    player(Player) & logic_program(CurrentLP) & .member(Player, CurrentLP) &
    slot(Slot) & color(C1) & color(C2) & C2 \== C1 &
    not has_card_color(Player, Slot, C2) & 
    not ~has_card_color(Player, Slot, C1).

abducible(has_card_rank(Player, Slot, R1)) :-
    player(Player) & logic_program(CurrentLP) & .member(Player, CurrentLP) &
    slot(Slot) & rank(R1) & rank(R2) & R1 \== R2 &
    not has_card_rank(Player, Slot, R2) & 
    not ~has_card_rank(Player, Slot, R1).



/* ------------------------- INTEGRITY CONSTRAINTS ------------------------- */

~has_card_color(Player, Slot, C1) :-
    player(Player) & slot(Slot) & color(C1) & color(C2) & C1 \== C2 &
    has_card_color(Player, Slot, C2).

~has_card_rank(Player, Slot, R1) :-
    player(Player) & slot(Slot) & rank(R1) & rank(R2) & R1 \== R2 &
    has_card_rank(Player, Slot, R2).

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


// number of cards that have been disclosed to me EXCEPT the identity of the 
// card of Player at position Slot

disclosed_cards(Color, Rank, Player, Slot, N) :-
    color(Color) & rank(Rank) & player(Player) & slot(Slot) &
    .findall(
        has_card(P, S, Color, Rank),
        has_card_color(P, S, Color) & has_card_rank(P, S, Rank) & slot(S) & P \== Player,
        L1
    ) & .length(L1, N1) &
    .findall(
        has_card(Player, S, Color, Rank),
        has_card_color(Player, S, Color) & has_card_rank(Player, S, Rank) & S \== Slot,
        L2
    ) & .length(L2, N2) &
    discarded(Color, Rank, N3) &
    card_in_stack(Color, Rank, N4) &
    N = N1 + N2 + N3 + N4.

card_in_stack(Color, Rank, 0) :- stack(Color, Stack) & Stack < Rank.
card_in_stack(Color, Rank, 1) :- stack(Color, Stack) & Stack >= Rank.

// An agent can only have a card of Color and Rank at any
// Slot of their holder if the number of cards of that Color and Rank that have
// been disclosed to the agent everywhere EXCEPT that Slot do not add up to the
// total number of cards of Rank

ic :-
    player(P) & slot(S) & color(C) & rank(R) &
    has_card_color(P, S, C) & has_card_rank(P, S, R) &
    disclosed_cards(C, R, P, S, N) & cards_per_rank(R, N).



/* ----------------------- ABDUCTIVE REASONING RULES ----------------------- */

abduce(Goal1 & Goal2, Delta0, Delta) :-
    custom.expr_operator(Goal1 & Goal2, "and") &
    //.log(debug, "abducing ", Goal1 & Goal2) &
    abduce(Goal1, Delta0, Delta1) &
    abduce(Goal2, Delta1, Delta).

abduce(Goal, Delta, Delta) :-
    not custom.expr_operator(Goal, _) & Goal.
    // & .log(debug, Goal, " is derived from the BB").

abduce(Goal, Delta, Delta) :-
    not custom.expr_operator(Goal, _) & not Goal &
    abducible(Goal) & .member(Goal, Delta).
    // & .log(debug, Goal, " has already been abduced").

abduce(Goal, Delta, [Goal|Delta]) :-
    not custom.expr_operator(Goal, _) & not Goal &
    abducible(Goal) & not .member(Goal, Delta).
    // & .log(debug, Goal, " is added to the explanation: ", [Goal|Delta]).

abduce(Goal, Delta0, Delta) :-
    not custom.expr_operator(Goal, _) & not Goal & not abducible(Goal) &
    .relevant_rules(Goal, RL) & .length(RL, N) & N > 0 &
    .member(R, RL) &
    custom.unify_goal_rule(Goal, R, UnifiedR) & 
    custom.rule_head_body(UnifiedR, _, Body) &
    // .log(debug, Goal, " is derived from rule: ", UnifiedR) &
    abduce(Body, Delta0, Delta).



/* --------------------- ABDUCTIVE REASONING PROCEDURE --------------------- */

// NOTE important difference:

// If LExpl --> [ [] ], it means that the plan being considered (that would result
// in selecting the observed action) is consistent with the current BB (aka the
// one that has been adopted by taking the perspective of the other agent).
// However, it does not provide any additional information.

// If LExpl --> [], it means that the plan being considered is not compatible
// with the BB (from the perspective of the other), and hence it could not
// have been selected in the first place.

@abduceOn[atomic]
+!abduce(ActingPlayer, Action) : abduction(on)
    <- hanabiAgent.backup_beliefs;
    !adopt_perspective([ActingPlayer]);

    // use explicit information conveyed by the hint when abducing
    // use that explicit knowledge with [source(aux)] annotation, so not to
    // interfere with knowledge from previous hints
    if ( Action = give_hint(HintedPlayer, Mode, Value, SlotList) ) {
        .concat("has_card_", Mode, String);
        .term2string(Term, String);
        ?cards_per_player(N);
        for ( .range(S, 1, N) ) {
            Belief =.. [Term, [HintedPlayer, S, Value], [source(aux)]];
            if ( .member(S, SlotList) ) { +Belief; } else { +(~Belief); }
        }
    }

    .findall(Plan, .relevant_plan({+?action(Action)}, Plan), LP);
    for ( .member(P, LP) ) {
        custom.decompose_plan(P, _, _, Context, _);
        // .log(debug, P, "\n", Context, "\n");
        .setof(Delta, abduce(Context, [], Delta), LExpl);
        // .log(debug, LExpl, "\n");
        for ( .member(Expl, LExpl) ) { 
            if ( .length(Expl, Num) & Num > 0) { +potential_explanation(Expl); }
        }
    }

    // gather all the explanations and recover my original BB
    .findall(E, potential_explanation(E), PotentialExpls);
    hanabiAgent.remove_beliefs;
    hanabiAgent.recover_beliefs;

    // update explicit information conveyed by the hint with the definitive source(hint)
    if ( Action = give_hint(HintedPlayer, Mode, Value, SlotList) ) {
        .concat("has_card_", Mode, String);
        .term2string(Term, String);
        ?cards_per_player(N);
        for ( .range(S, 1, N) ) {
            Belief =.. [Term, [HintedPlayer, S, Value], [source(hint)]];
            if ( .member(S, SlotList) ) { +Belief; } else { +(~Belief); }
        }
    }

    !filter_explanations(PotentialExpls).


@abduceOff[atomic]
+!abduce(_, _) : abduction(off).


@filterExplanations1[atomic]
+!filter_explanations(L) : .length(L, N) & N > 0
    <- for ( .member(Exp, L) ) { !validate_explanation(Exp); }

    // gather all the explanations that have been validated
    .findall(E, valid_explanation(E), ListValidExpls);
    .findall(NE, negated_explanation(NE), ListNegExpls);

    if ( .length(ListValidExpls, V) & .length(ListNegExpls, V) & V > 0 ) {
        custom.list2formula(ListValidExpls, 0, "or", DNF);
        custom.list2formula(ListNegExpls, 0, "and", NegDNF);
        ?abd_id(Id);
        +abduction_explanation(DNF) [source(abduction), abd_id(Id)];
        custom.rule_head_body(NewIC, ic [source(abduction), abd_id(Id)], NegDNF);
        +NewIC;
        .log(debug, DNF, "\n", NewIC, "\n\n");
        -+abd_id(Id+1);
    }

    .abolish(valid_explanation(_));
    .abolish(negated_explanation(_)).


@filterExplanations2[atomic]
+!filter_explanations([]).


@validateExplanation[atomic]
+!validate_explanation(Exp) : true
    <- custom.list2formula(Exp, 0, "and", Conj);

    // check that the explanation is *informative*, i.e. cannot be derived from the BB
    if ( not Conj ) {

        // check that the explanation is consistent with the ICs
        for ( .member(Fact, Exp) ) {
            if ( not Fact ) {
                +informative_fact(Fact);
                +Fact [source(validation)];
            }
        }

        if ( not ic ) {
            .findall(F, informative_fact(F), RefinedExpl);
            custom.list2formula(RefinedExpl, 0, "and", PosConj);
            custom.list2formula(RefinedExpl, 1, "or", NegConj);
            +valid_explanation(PosConj);
            +negated_explanation(NegConj);
        }
    }

    .findall(F, informative_fact(F), RemovalList);
    for ( .member(F, RemovalList) ) {
        -informative_fact(F);
        -F [source(validation)];
    }.



/* --------------------- ABDUCTIVE EXPLANATIONS UPDATE --------------------- */

// update the abduction explanations when the player plays or discards a card
// and comes to know of its color and rank
// if an abductive explanation becomes true when the new knowledge from the
// card that has just been disclosed by playing or discarding it, that
// explanation and its associated IC are removed

@updateExplanationsOn[atomic]
+!update_abduction_explanations(Slot, Color, Rank) : abduction(on) & my_name(Me)
    <- .findall(
        DNF,
        abduction_explanation(DNF),
        PrevExplanations
    );

    +has_card_color(Me, Slot, Color) [source(update)];
    +has_card_rank(Me, Slot, Rank) [source(update)];

    for ( .member(DNF, PrevExplanations) ) {
        if ( DNF ) {
            .findall(
                Id,
                abduction_explanation(M) [source(abduction), abd_id(Id)],
                IDs
            );
            .abolish(abduction_explanation(DNF));
            for ( .member(I, IDs) ) {
                .relevant_rules(ic [abd_id(I)], RelevantICs);
                for ( .member(IC, RelevantICs) ) { -IC [source(abduction)]; }
            }
        }
    }
    -has_card_color(Me, Slot, Color) [source(update)];
    -has_card_rank(Me, Slot, Rank) [source(update)].


@updateExplanationsOff[atomic]
+!update_abduction_explanations(_, _, _) : abduction(off).
