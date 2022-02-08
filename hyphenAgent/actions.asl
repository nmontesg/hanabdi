// Basic plan library of procedural goals for the Hanabi-playing agent.
// These procedural goals correspond to the ACTIONS that players can take
// in the game.

/* ---------- Plans for basic game actions ---------- */

// these are procedural plans to take direct action in the game
// process the explicit information conveyed by the action (ordered slots update)

@playCard[atomic]
+!play_card(Slot) : true
    <- play_card(Slot);
    //!update_slots(took_card(Slot));
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

@giveColorHint[atomic]
+!give_hint(ToPlayer, color, Value) : true
    <- ?hint_id(Id);
    spend_info_token;
    .findall(S, has_card_color(ToPlayer, S, Value) [source(percept)], Slots); 
    .my_name(FromPlayer);
    !process_action(hint(Id, FromPlayer, ToPlayer, color, Value, Slots));
    finish_turn.

@giveRankHint[atomic]
+!give_hint(ToPlayer, rank, Value) : true
    <- ?hint_id(Id);
    spend_info_token;
    .findall(S, has_card_rank(ToPlayer, S, Value) [source(percept)], Slots); 
    .my_name(FromPlayer);
    !process_action(hint(Id, FromPlayer, ToPlayer, rank, Value, Slots));
    finish_turn.
