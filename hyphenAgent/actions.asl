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
+!play_card(Slot) : my_name(Me)
    <- .broadcast(publicAction, play_card(Slot));
    !remove_hint_info(Me, Slot);
    // wait for everyone else to process the public action
    .suspend(play_card(Slot));
    play_card(Slot);
    !update_slots(took_card(Slot));
    .broadcast(achieve, update_slots(took_card(Slot)));
    !replace_card(Slot);
    finish_turn.

@discardCard
+!discard_card(Slot) : my_name(Me)
    <- .broadcast(publicAction, discard_card(Slot));
    !remove_hint_info(Me, Slot);
    // wait for everyone else to process the public action
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
    ?cards_per_player(N);
    for ( .range(S, 1, N) ) {
        if ( .member(S, Slots) ) { +has_card_color(ToPlayer, S, Value) [source(hint), hint_id(Id)]; }
        else  { +~has_card_color(ToPlayer, S, Value) [source(hint), hint_id(Id)]; }
    }
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
    ?cards_per_player(N);
    for ( .range(S, 1, N) ) {
        if ( .member(S, Slots) ) { +has_card_rank(ToPlayer, S, Value) [source(hint), hint_id(Id)]; }
        else  { +~has_card_rank(ToPlayer, S, Value) [source(hint), hint_id(Id)]; }
    }
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
    +ordered_slots(Me, Lprime).

@updateSlots2[atomic]
+!update_slots(took_card(Slot)) [source(Player)] : Player \== self
    <- ?ordered_slots(Player, L);
    .nth(N, L, Slot);
    .delete(N, L, Lprime);
    -ordered_slots(Player, _);
    +ordered_slots(Player, Lprime).

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
    <- .abolish(has_card_color(Player, Slot, _) [hint_id(_), source(hint)]);
    .abolish(~has_card_color(Player, Slot, _) [hint_id(_), source(hint)]);
    .abolish(has_card_rank(Player, Slot, _) [hint_id(_), source(hint)]);
    .abolish(~has_card_rank(Player, Slot, _) [hint_id(_), source(hint)]).

@receiveFinishMessage[atomic]
+finish_process_action [source(Player)] : true
    <- ?finished_process_action(N);
    -+finished_process_action(N+1);
    -finish_process_action [source(Player)].

@resumeAction1[atomic]
+finished_process_action(M)
    : num_players(N) & M == N-1 & .suspended(play_card(Slot), _)
    <- .resume(play_card(Slot)).

@resumeAction2[atomic]
+finished_process_action(M)
    : num_players(N) & M == N-1 & .suspended(discard_card(Slot), _)
    <- .resume(discard_card(Slot)).

@resumeAction3[atomic]
+finished_process_action(M)
    : num_players(N) & M == N-1 & .suspended(give_hint(ToPlayer, Mode, Value), _)
    <- .resume(give_hint(ToPlayer, Mode, Value)).

/*
@resumeAction[atomic]
+finished_abduction_messages(N)
    : num_players(N) & M == N-1 & .suspended(player_turn(Me), _) & .my_name(Me)
    <- .resume(player_turn(Me)).
*/
