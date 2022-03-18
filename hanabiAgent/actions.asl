// Basic plan library of procedural goals for the Hanabi-playing agent.
// These procedural goals correspond to the ACTIONS that players can take
// in the game.

/* ---------- Plans for basic game actions ---------- */

// these are procedural plans to take direct action in the game
// process the explicit information conveyed by the action (ordered slots update)

// abduction must happen BEFORE the agent performs the action, because all
// other players have to abduce with the state of the game as it is when
// the action is selected, i.e. BEFORE it is performed

@receiveFinishMessage[atomic]
+finished_abduction [source(Player)] : true
    <- ?finished_abduction(N);
    -+finished_abduction(N+1);
    -finished_abduction [source(Player)].

@resumeAction[atomic]
+finished_abduction(M) : num_players(N) & M == N-1
    <- ?my_action(Action);
    !Action;
    .abolish(my_action(_)).

@playCard[atomic]
+!play_card(Slot) : my_name(Me)
    <- custom.map.new_map(Map);
    play_card(Slot, Map);
    custom.map.get_by_key(Map, C, Color);
    custom.map.get_by_key(Map, R, Rank);
    !update_abduction_explanations(Slot, Color, Rank);
    // remove beliefs related to information on that card from hints
    !remove_hint_info(Me, Slot);
    .broadcast(achieve, remove_hint_info(Me, Slot));
    // remove slot from ordered slots
    !update_slots(took_card(Slot));
    .broadcast(achieve, update_slots(took_card(Slot)));
    !replace_card(Slot);
    finish_turn.

@discardCard[atomic]
+!discard_card(Slot) : my_name(Me)
    <- custom.map.new_map(Map);
    discard_card(Slot, Map);
    custom.map.get_by_key(Map, C, Color);
    custom.map.get_by_key(Map, R, Rank);
    !update_abduction_explanations(Slot, Color, Rank);
    // remove beliefs related to information on that card from hints
    !remove_hint_info(Me, Slot);
    .broadcast(achieve, remove_hint_info(Me, Slot));
    // remove slot from ordered slots
    !update_slots(took_card(Slot));
    .broadcast(achieve, update_slots(took_card(Slot)));
    !replace_card(Slot);
    finish_turn.

@giveHint[atomic]
+!give_hint(HintedPlayer, Mode, Value) : .my_name(Me)
    <- .concat("has_card_", Mode, String);
    .term2string(Term, String);
    Query =.. [Term, [HintedPlayer, S1, Value], [source(percept)]];
    .findall(S1, Query, SlotList);
    ?hint_id(Id);
    +hint(Id, Me, HintedPlayer, Mode, Value, SlotList);
    ?cards_per_player(N);
    for ( .range(S, 1, N) ) {
        Belief =.. [Term, [HintedPlayer, S, Value], [source(hint), hint_id(Id)]];
        if ( .member(S, SlotList) ) { +Belief; } else { +(~Belief); }
    }
    spend_info_token;
    finish_turn.

@replaceCard1[atomic]
+!replace_card(Slot) : num_cards_deck(D) & D > 0
    <- draw_random_card(Slot);
    !update_slots(placed_card(Slot));
    .broadcast(achieve, update_slots(placed_card(Slot))).

@replaceCard2[atomic]
+!replace_card(Slot) : num_cards_deck(0) & my_name(Me)
    <- .abolish(has_card_color(Me, Slot, _));
    .abolish(has_card_rank(Me, Slot, _)).

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
