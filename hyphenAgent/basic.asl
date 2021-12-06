// Agent hyphen_agent in project hanabdi
//
// Basic plan library of procedural goals

/* Initial beliefs and rules */

/* Plans */

/* ---------- Plan to initialize ordered slots for all players ---------- */

@getReady[atomic]
+!get_ready : cards_per_player(N)
    <- .findall(Ag, player(Ag), PlayerList);
    .findall(X, .range(X, 1, N), SlotList);
    for ( .member(P, PlayerList) ) {
        +ordered_slots(P, SlotList);
    }
    .send(game_master, tell, ready).


/* ---------- Plans for basic game actions ---------- */

// these are procedural plans to take direct action in the game

@playCard[atomic]
+!play_card(Slot) : true
    <- play_card(Slot);
    !process_action(took_card(Slot));
    !replace_card(Slot);
    finish_turn.

@discardCard[atomic]
+!discard_card(Slot) : true
    <- discard_card(Slot);
    !process_action(took_card(Slot));    
    !replace_card(Slot);
    finish_turn.

@replaceCard1[atomic]
+!replace_card(Slot) : num_cards_deck(D) & D > 0
    <- draw_random_card(Slot);
    !process_action(placed_card(Slot)).

@replaceCard2[atomic]
+!replace_card(Slot) : num_cards_deck(0).

// Mode is either color or rank
@giveHint[atomic]
+!give_hint(ToPlayer, Mode, Value) : true
    <- ?hint_id(Id);
    spend_info_token;
    .concat("has_card_", Mode, String);
    .term2string(Term, String);
    Goal =.. [Term, [ToPlayer, S, Value], [source(percept)]];
    .findall(S, Goal, Slots);
    .my_name(FromPlayer);
    !process_action(hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots));
    finish_turn.


/* ---------- Plans to process actions by myself ---------- */

@processAction[atomic]
+!process_action(Action) : true
    <- !process_my_action(Action);
    .broadcast(publicAction, Action).

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
+!process_my_action(hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots)) : cards_per_player(N)
    <- +hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots);
    .concat("has_card_", Mode, String);
    .term2string(Term, String);
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
+!kqml_received(KQML_Sender_Var, publicAction, took_card(Slot), KQML_MsgId) : true
    <- ?ordered_slots(KQML_Sender_Var, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(KQML_Sender_Var, _);
    +ordered_slots(KQML_Sender_Var, Lprime);
    !remove_hint_info(KQML_Sender_Var, Slot).


@kqmlReceivedPublicAction2[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, placed_card(Slot), KQML_MsgId) : true
    <- ?ordered_slots(KQML_Sender_Var, L);
    .concat(L, [Slot], Lprime);
    -ordered_slots(KQML_Sender_Var, _);
    +ordered_slots(KQML_Sender_Var, Lprime).


// kqml_received plan to process explicit information
// from hints given by other players
@kqmlReceivedPublicAction3[atomic]
+!kqml_received(KQML_Sender_Var, publicAction, hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots), KQML_MsgId) : cards_per_player(N)
    <- +hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots);
    .concat("has_card_", Mode, String);
    .term2string(Term, String);
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
