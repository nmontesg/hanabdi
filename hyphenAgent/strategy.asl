// generic plan to select and action and perform it when the agent perceives
// that it is their turn.

// TODO: dropping the player_turn event when taking the perspective of another
// might not work when going to higher-order ToM (>1)

@actInTheGame[atomic]
+player_turn(Me) : .my_name(Me) & turn_number(Me, 1)
    <- -+finished_process_action(0);
    ?select_action(Action);
    .print("I selected the action: ", Action);
    !Action.

// The pre-defined selection function to choose a plan among those that are
// applicable chooses according to the order in which plans appear in the
// plan library. This is good to program the strategic selection of an action
// to take

@hintCriticalCard
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    has_critical_card(HintedPlayer, Slot).

@playPlayableCard
+?select_action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableCard
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    unhinted(HintedPlayer, S) &
    my_name(Me) & Me \== HintedPlayer &
    has_card_rank(HintedPlayer, S, Rank) &
    has_playable_card(HintedPlayer, S).

@discardMyChopCard
+?select_action(discard_card(Chop)) :
    spent_info_tokens & my_name(Me) & chop(Me, Chop).

@defaultAction
+?select_action(play_card(Slot)) :
    my_name(Me) & ordered_slots(Me, [Slot|_]).
