// generic plan to select and action and perform it when the agent perceives
// that it is their turn.

// abduction must happen BEFORE the agent performs the action, because all
// other players have to abduce with the state of the game as it is when
// the action is selected, i.e. BEFORE it is performed

+player_turn(N) : my_name(Name) & .my_name(Me) & Name \== Me
    <- .drop_event(player_turn(N)).

+player_turn(N) : my_name(Me) & turn_number(Me, N)
    <- -+finished_abduction_messages(0);
    ?select_action(Action);
    .print("I selected the action: ", Action);
    //!play_card(1).
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
    has_critical_card(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, Rank).    

@playPlayableCard
+?select_action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableCard1[generic(hintPlayableCard), priority(1)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    has_playable_card(HintedPlayer, 1) &
    unhinted(HintedPlayer, 1) &
    has_card_rank(HintedPlayer, 1, Rank).

@hintPlayableCard2[generic(hintPlayableCard), priority(2)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    has_playable_card(HintedPlayer, 2) &
    unhinted(HintedPlayer, 2) &
    has_card_rank(HintedPlayer, 2, Rank).

@hintPlayableCard3[generic(hintPlayableCard), priority(3)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    has_playable_card(HintedPlayer, 3) &
    unhinted(HintedPlayer, 3) &
    has_card_rank(HintedPlayer, 3, Rank).

@hintPlayableCard4[generic(hintPlayableCard), priority(4)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    has_playable_card(HintedPlayer, 4) &
    unhinted(HintedPlayer, 4) &
    has_card_rank(HintedPlayer, 4, Rank).

@hintPlayableCard5[generic(hintPlayableCard), priority(5)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    has_playable_card(HintedPlayer, 5) &
    unhinted(HintedPlayer, 5) &
    has_card_rank(HintedPlayer, 5, Rank).

@hintPlayableCard6[generic(hintPlayableCard), priority(6)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    has_playable_card(HintedPlayer, 1) &
    unhinted(HintedPlayer, 1) &
    has_card_rank(HintedPlayer, 1, Rank).

@hintPlayableCard7[generic(hintPlayableCard), priority(7)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    has_playable_card(HintedPlayer, 2) &
    unhinted(HintedPlayer, 2) &
    has_card_rank(HintedPlayer, 2, Rank).

@hintPlayableCard8[generic(hintPlayableCard), priority(8)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    has_playable_card(HintedPlayer, 3) &
    unhinted(HintedPlayer, 3) &
    has_card_rank(HintedPlayer, 3, Rank).

@hintPlayableCard9[generic(hintPlayableCard), priority(9)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    has_playable_card(HintedPlayer, 4) &
    unhinted(HintedPlayer, 4) &
    has_card_rank(HintedPlayer, 4, Rank).

@hintPlayableCard10[generic(hintPlayableCard), priority(10)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    has_playable_card(HintedPlayer, 5) &
    unhinted(HintedPlayer, 5) &
    has_card_rank(HintedPlayer, 5, Rank).

@discardMyChopCard
+?select_action(discard_card(Chop)) :
    spent_info_tokens & my_name(Me) & chop(Me, Chop).

@defaultAction
+?select_action(play_card(Slot)) :
    my_name(Me) & ordered_slots(Me, [Slot|_]).
