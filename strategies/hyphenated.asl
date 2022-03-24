@hintCriticalFive[priority(1)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 5).

@hintCriticalCard[priority(2)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_critical_card(HintedPlayer, Slot).

@hintTwoOnChop[priority(3)]
+?action(give_hint(HintedPlayer, rank, 2)) :
    available_info_tokens &
    my_name(Me) & player(HintedPlayer) & Me \== HintedPlayer &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 2) &
    has_card_color(HintedPlayer, Slot, Color) &
    stack(Color, S) & S < 2.

@playPlayableCard[priority(4)]
+?action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableOne[priority(5)]
+?action(give_hint(HintedPlayer, rank, 1)) :
    available_info_tokens &
    my_name(Me) & player(HintedPlayer) & Me \== HintedPlayer &
    slot(Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, 1) &
    stack(Color, 0) &
    unhinted_card(Color, 1).

@hintPlayableCard[priority(6)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    my_name(Me) & player(HintedPlayer) & Me \== HintedPlayer &
    slot(Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    stack(Color, S) & S = Rank-1 &
    unhinted_card(Color, Rank).




@discardUselessCard[priority(7)]
+?action(discard_card(Slot)) :
    my_name(Me) & spent_info_tokens & has_useless_card(Me, Slot).


@discardChop[priority(8)]
+?action(discard_card(Slot)) :
    my_name(Me) & spent_info_tokens & chop(Me, Slot).


@hintNonCriticalFive[priority(9)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    my_name(Me) & player(HintedPlayer) & Me \== HintedPlayer &
    slot(Slot) & has_card_rank(HintedPlayer, Slot, 5) &
    unhinted(HintedPlayer, Slot).


@hintNonCriticalCard[priority(10)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    my_name(Me) & player(HintedPlayer) & Me \== HintedPlayer &
    slot(Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_critical_card(HintedPlayer, Slot) &
    unhinted(HintedPlayer, Slot).



/*
@hintPlayableCard[priority(5)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    closest_player_with_oldest_unhinted_playable_card(Player, Slot) &
    has_card_color(Player, Slot, Color).
*/
