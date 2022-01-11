// This script contains the plan to update beliefs based on what action I
// have taken and what actions have been taken by others.
// Because actions by other agents are not automatically perceived by other
// agents in Jason, agents need to performa a broadcast so that all agents
// are aware of what everyone else is doing. A custom performative
// ``publicAction'' is used for that.
// Belief update for actions performed by oneself happens through standard
// Jason plans.
// Belief update for actions performed by others (and received through
// communication) is handled through kqml_received plans.
// These plans only handle EXPLICIT information directly communicated or
// otherwise conveyed by the agents.

@processAction[atomic]
+!process_action(Action) : true
    <- !process_my_action(Action);
    .broadcast(publicAction, Action).

/* ---------- Plans to process actions by myself ---------- */

@processMyAction1[atomic]
+!process_my_action(took_card(Slot)) : true
    <- .my_name(Me);
    ?ordered_slots(Me, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(Me, _);
    +ordered_slots(Me, Lprime);
    !remove_hint_info(Me, Slot).

@processMyAction2[atomic]
+!process_my_action(placed_card(Slot)) : true
    <- .my_name(Me);
    ?ordered_slots(Me, L);
    .concat(L, [Slot], Lprime);
    -ordered_slots(Me, _);
    +ordered_slots(Me, Lprime).

@processMyAction3[atomic]
+!process_my_action(hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots)) : true
    <- +hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots);
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
    }.

/* ---------- Plans to process actions by other players ---------- */

// Actions in the game are public, however they are not automatically
// perceived in Jason. To emulate observability of actions, we have
// agents broadcast whether they pick a card or place a card from or
// into their card holder respectively. These have a custom performative
// called ``publicAction''. The following plans process the information
// of messages received with such a performative.

@kqmlReceivedPublicAction1[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, took_card(Slot), KQML_MsgId)
    : true
    <- ?ordered_slots(KQML_Sender_Var, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(KQML_Sender_Var, _);
    +ordered_slots(KQML_Sender_Var, Lprime);
    !remove_hint_info(KQML_Sender_Var, Slot).


@kqmlReceivedPublicAction2[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, placed_card(Slot), KQML_MsgId)
    : true
    <- ?ordered_slots(KQML_Sender_Var, L);
    .concat(L, [Slot], Lprime);
    -ordered_slots(KQML_Sender_Var, _);
    +ordered_slots(KQML_Sender_Var, Lprime).


// kqml_received plan to process explicit information
// from hints given by other players
@kqmlReceivedPublicAction3[atomic]
+!kqml_received(KQML_Sender_Var, publicAction,
                hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots), KQML_MsgId)
    : true
    <- +hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots);
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
    }.

// Remove the information coming from HINTS, not PERCEPTS.
// Percepts are automatically updated by the Jason interpreter.
@removeHintInfo[atomic]
+!remove_hint_info(Player, Slot) : true
    <- -has_card_color(Player, Slot, _) [hint_id(_), source(hint)];
    -~has_card_color(Player, Slot, _) [hint_id(_), source(hint)];
    -has_card_rank(Player, Slot, _) [hint_id(_), source(hint)];
    -~has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].
