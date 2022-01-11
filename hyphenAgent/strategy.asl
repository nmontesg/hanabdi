// generic plan to select and action and perform it when the agent perceives
// that it is their turn

+player_turn(N) : my_name(Me) & turn_number(Me, N)
    <- !select_action(Action);
    .print("I selected the action: ", Action);
    !Action.

// The pre-defined selection function to choose a plan among those that are
// applicable chooses according to the order in which plans appear in the
// plan library. This is good to program the strategic selection of an action
// to take

@hintCriticalCard
+!select_action(give_hint(ToPlayer, rank, Rank)) :
    num_info_tokens(M) & M > 0 &
    turns_ahead(ToPlayer, 1) &
    has_critical_card(ToPlayer, Slot) &
    chop(ToPlayer, Slot) &
    has_card_rank(ToPlayer, Slot, Rank).

@playPlayableCard
+!select_action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableCard
+!select_action(give_hint(HintedPlayer, rank, Rank)) :
    num_info_tokens(M) & M > 0 &
    // get who is the closest player with playable cards
    my_name(Me) &
    .findall(Player, ( has_playable_card(Player, Slot) & Player \== Me & unhinted(Player, Slot) ), L) &
    .findall(T, ( .member(P, L) & turn_number(P, T) ), Turns) &
    .min(Turns, ClosestTurn) &
    turn_number(HintedPlayer, ClosestTurn) &
    // get all the playable cards of the closest player that has some and select the oldest
    ordered_slots(HintedPlayer, OrderedSlots) &
    .findall(S, has_playable_card(HintedPlayer, S), SlotList) &
    .findall(Pos, ( .member(M, SlotList) & .nth(Pos, OrderedSlots, M) ), PosList) &
    .min(PosList, Min) &
    .nth(Min, OrderedSlots, FocusSlot).
    has_card_rank(HintedPlayer, FocusSlot, Rank).

@discardMyChopCard
+!select_action(discard_card(Chop)) :
    num_info_tokens(N) & max_info_tokens(Total) & N < Total &
    my_name(Me) & chop(Me, Chop).

@defaultAction
+!select_action(play_card(Slot)) :
    my_name(Me) & ordered_slots(Me, [Slot|_]).
