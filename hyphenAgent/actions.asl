// Basic plan library of procedural goals for the Hanabi-playing agent.
// These procedural goals correspond to the ACTIONS that players can take
// in the game.

/* ---------- Plans for basic game actions ---------- */

// these are procedural plans to take direct action in the game
// process the explicit information conveyed by the action (ordered slots update)

// abduction must happen BEFORE the agent performs the action, because all
// other players have to abduce with the state of the game as it is when
// the action is selected, i.e. BEFORE it is performed

@playCard
+!play_card(Slot) : true
    <- .broadcast(publicAction, play_card(Slot));
    // wait for everyone else to perform abduction
    .suspend(play_card(Slot));
    play_card(Slot);
    !update_slots(took_card(Slot));
    .broadcast(achieve, update_slots(took_card(Slot)));
    !replace_card(Slot);
    finish_turn.

@discardCard
+!discard_card(Slot) : true
    <- .broadcast(publicAction, discard_card(Slot));
    // wait for everyone else to perform abduction
    .suspend(discard_card(Slot));
    discard_card(Slot);
    !update_slots(took_card(Slot));
    .broadcast(achieve, update_slots(took_card(Slot)));
    !replace_card(Slot);
    finish_turn.

@giveColorHint
+!give_hint(ToPlayer, color, Value) : true
    <- ?hint_id(Id);
    .findall(S, has_card_color(ToPlayer, S, Value) [source(percept)], Slots); 
    .my_name(FromPlayer);
    +hint(Id, FromPlayer, ToPlayer, color, Value, Slots);
    .broadcast(publicAction, hint(Id, FromPlayer, ToPlayer, color, Value, Slots));
    // wait for everyone else to perform abduction
    .suspend(give_hint(ToPlayer, color, Value));
    spend_info_token;
    finish_turn.

@giveRankHint
+!give_hint(ToPlayer, rank, Value) : true
    <- ?hint_id(Id);
    .findall(S, has_card_rank(ToPlayer, S, Value) [source(percept)], Slots); 
    .my_name(FromPlayer);
    +hint(Id, FromPlayer, ToPlayer, rank, Value, Slots);
    .broadcast(publicAction, hint(Id, FromPlayer, ToPlayer, rank, Value, Slots));
    // wait for everyone else to perform abduction
    .suspend(give_hint(ToPlayer, rank, Value));
    spend_info_token;
    finish_turn.

@replaceCard1[atomic]
+!replace_card(Slot) : num_cards_deck(D) & D > 0
    <- draw_random_card(Slot);
    !update_slots(placed_card(Slot));
    .broadcast(achieve, update_slots(placed_card(Slot))).

@replaceCard2[atomic]
+!replace_card(Slot) : num_cards_deck(0).

@updateSlots1[atomic]
+!update_slots(took_card(Slot)) [source(self)] : my_name(Me)
    <- ?ordered_slots(Me, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(Me, _);
    +ordered_slots(Me, Lprime);
    !remove_hint_info(Me, Slot).

@updateSlots2[atomic]
+!update_slots(took_card(Slot)) [source(Player)] : Player \== self
    <- ?ordered_slots(Player, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(Player, _);
    +ordered_slots(Player, Lprime);
    !remove_hint_info(Player, Slot).

@updateSlots3[atomic]
+!update_slots(placed_card(Slot)) [source(self)] : my_name(Me)
    <- ?ordered_slots(Me, L);
    .concat(L, [Slot], Lprime);
    -ordered_slots(Me, _);
    +ordered_slots(Me, Lprime).

@updateSlots4[atomic]
+!update_slots(placed_card(Slot)) [source(Player)] : Player \== self
    <- ?ordered_slots(Player, L);
    .concat(L, [Slot], Lprime);
    -ordered_slots(Player, _);
    +ordered_slots(Player, Lprime).

// Remove the information coming from HINTS, not PERCEPTS.
// Percepts are automatically updated by the Jason interpreter.
@removeHintInfo[atomic]
+!remove_hint_info(Player, Slot) : true
    <- -has_card_color(Player, Slot, _) [hint_id(_), source(hint)];
    -~has_card_color(Player, Slot, _) [hint_id(_), source(hint)];
    -has_card_rank(Player, Slot, _) [hint_id(_), source(hint)];
    -~has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

@receiveFinishMessage[atomic]
+finished_abduction [source(Player)] : true
    <- ?finished_abduction_messages(N);
    -+finished_abduction_messages(N+1);
    -finished_abduction [source(Player)].

+finished_abduction_messages(M)
    : num_players(N) & M == N-1 & .suspended(play_card(Slot), _)
    <- .resume(play_card(Slot)).

+finished_abduction_messages(M)
    : num_players(N) & M == N-1 & .suspended(discard_card(Slot), _)
    <- .resume(discard_card(Slot)).

+finished_abduction_messages(M)
    : num_players(N) & M == N-1 & .suspended(give_hint(ToPlayer, Mode, Value), _)
    <- .resume(give_hint(ToPlayer, Mode, Value)).
