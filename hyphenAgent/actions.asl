// Basic plan library of procedural goals for the Hanabi-playing agent.
// These procedural goals correspond to the ACTIONS that players can take
// in the game.


/* ---------- Plan to initialize ordered slots for all players ---------- */

@getReady[atomic]
+!get_ready : true
    <- ?seed(Seed);
    .set_random_seed(Seed);
    .my_name(Me);
    +my_name(Me);
    ?cards_per_player(N);
    .findall(Ag, player(Ag), PlayerList);
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
    // all other players must perform abduction reasoning here, BEFORE 
    // processing ordered_slots
    // ...
    // process the explicit information conveyed by the action (ordered slots update)
    !process_action(took_card(Slot));
    !replace_card(Slot);
    finish_turn.

@discardCard[atomic]
+!discard_card(Slot) : true
    <- discard_card(Slot);
    // all other players must perform abduction reasoning here, BEFORE 
    // processing ordered_slots
    // ...
    // process the explicit information conveyed by the action (ordered slots update)
    !process_action(took_card(Slot));    
    !replace_card(Slot);
    finish_turn.

@replaceCard1[atomic]
+!replace_card(Slot) : num_cards_deck(D) & D > 0
    <- draw_random_card(Slot);
    // process the explicit information conveyed by the action (ordered slots update)
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
    .findall(S, ( Goal & Goal =.. [Term, [ToPlayer, S, Value], [source(percept)]] ), Slots); 
    .my_name(FromPlayer);
    !process_action(hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots));
    // all other players must perform abduction reasoning here, AFTER 
    // processing the explicit information conveyed by the hints
    finish_turn. 
