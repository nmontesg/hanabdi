{ include("strategies/hyphenated_rules.asl") }

@hintCriticalFive[priority(1)]
+?action(give_hint(Player, rank, 5, SlotList)) :
    available_info_tokens &
    player(Player) & my_name(Me) & Player \== Me &
    chop(Player, Chop) &
    has_card_rank(Player, Chop, 5) &
    has_card_color(Player, Chop, Color) &
    useful(Color, 5) &
    unhinted(Color, 5) &
    common_slots(Player, 5, SlotList).


@hintCriticalCard[priority(2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    player(Player) & my_name(Me) & Player \== Me &
    chop(Player, Chop) &
    has_card_color(Player, Chop, Color) &
    has_card_rank(Player, Chop, Rank) & Rank \== 5 &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).


@hintPlayableCardColor[priority(3)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).


@hintPlayableCardRank[priority(4)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).


@playPlayableCard[priority(5)]
+?action(play_card(Slot)) :
    my_name(Me) & slot(Slot) &
    has_card_color(Me, Slot, Color) &
    has_card_rank(Me, Slot, Rank) &
    playable(Color, Rank).


@reiterateColorHintOnPlayableCard[priority(6)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).


@reiterateRankHintOnPlayableCard[priority(7)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).


@discardUselessCard[priority(8)]
+?action(discard_card(Slot)) :
    spent_info_tokens &
    my_name(Me) &
    has_card_color(Me, Slot, Color) &
    has_card_rank(Me, Slot, Rank) &
    useless(Color, Rank).


@discardChop[priority(9)]
+?action(discard_card(C)) :
    spent_info_tokens &
    my_name(Me) &
    chop(Me, C).


@reiterateRankHintOnCriticalCard[priority(10)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).


@reiterateColorHintOnCriticalCard[priority(11)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).


@reiterateColorHintOnEventuallyPlayableCard[priority(12)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).



@reiterateRankHintOnEventuallyPlayableCard[priority(13)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).


@reiterateTotalHintOnPlayableCard[priority(14)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    totally_hinted(Player, Slot) &
    playable(Color, Rank) &
    common_slots(Player, Color, SlotList).


@reiterateColorHintOnUselessCardColor[priority(15)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useless(Color, Rank) &
    common_slots(Player, Color, SlotList).


@reiterateRankHintOnUselessCardRank[priority(16)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    my_name(Me) & player(Player) & Me \== Player &
    slot(Slot) &
    has_card_rank(Player, Slot, Rank) &
    has_card_color(Player, Slot, Color) &
    partially_hinted(Player, Slot, color) &
    useless(Color, Rank) &
    common_slots(Player, Color, SlotList).


@discardOldest[priority(17)]
+?action(discard_card(Slot)) :
    spent_info_tokens &
    my_name(Me) &
    ordered_slots(Me, [Slot|_]).


@playOldest[priority(18)]
+?action(play_card(Slot)) :
    max_info_tokens(Tokens) &
    num_info_tokens(Tokens) &
    my_name(Me) &
    ordered_slots(Me, [Slot|_]).


/* ------------------------------------------------------------------------- */

