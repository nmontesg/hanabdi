@hintCriticalCard[priority(1)]
+?action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    has_critical_card(HintedPlayer, Slot) &
    unhinted(HintedPlayer, Slot).

@playPlayableCard[priority(2)]
+?action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableCard[priority(3)]
+?action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    unhinted(HintedPlayer, Slot) &
    my_name(Me) & Me \== HintedPlayer &
    has_card_rank(HintedPlayer, Slot, Rank) &
    has_playable_card(HintedPlayer, Slot).

@discardMyChopCard[priority(4)]
+?action(discard_card(Chop)) :
    spent_info_tokens & my_name(Me) & chop(Me, Chop).

@defaultAction[priority(5)]
+?action(play_card(Slot)) :
    my_name(Me) & ordered_slots(Me, [Slot|_]).
