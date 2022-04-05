{ include("strategies/hyphenated_rules.asl") }

@hintCriticalFive1[priority(1.0)]
+?action(give_hint(Player, rank, 5, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    chop(Player, Chop) &
    has_card_rank(Player, Chop, 5) &
    has_card_color(Player, Chop, Color) &
    useful(Color, 5) &
    unhinted(Color, 5) &
    common_slots(Player, 5, SlotList).

@hintCriticalFive2[priority(1.1)]
+?action(give_hint(Player, rank, 5, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    chop(Player, Chop) &
    has_card_rank(Player, Chop, 5) &
    has_card_color(Player, Chop, Color) &
    useful(Color, 5) &
    unhinted(Color, 5) &
    common_slots(Player, 5, SlotList).

@hintCriticalFive3[priority(1.2)]
+?action(give_hint(Player, rank, 5, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    chop(Player, Chop) &
    has_card_rank(Player, Chop, 5) &
    has_card_color(Player, Chop, Color) &
    useful(Color, 5) &
    unhinted(Color, 5) &
    common_slots(Player, 5, SlotList).

@hintCriticalFive4[priority(1.3)]
+?action(give_hint(Player, rank, 5, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    chop(Player, Chop) &
    has_card_rank(Player, Chop, 5) &
    has_card_color(Player, Chop, Color) &
    useful(Color, 5) &
    unhinted(Color, 5) &
    common_slots(Player, 5, SlotList).

/* ------------------------------------------------------------------------- */

@hintCriticalCard1[priority(2.0)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    chop(Player, Chop) &
    has_card_color(Player, Chop, Color) &
    has_card_rank(Player, Chop, Rank) & Rank \== 5 &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@hintCriticalCard2[priority(2.1)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    chop(Player, Chop) &
    has_card_color(Player, Chop, Color) &
    has_card_rank(Player, Chop, Rank) & Rank \== 5 &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@hintCriticalCard3[priority(2.2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    chop(Player, Chop) &
    has_card_color(Player, Chop, Color) &
    has_card_rank(Player, Chop, Rank) & Rank \== 5 &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@hintCriticalCard4[priority(2.3)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    chop(Player, Chop) &
    has_card_color(Player, Chop, Color) &
    has_card_rank(Player, Chop, Rank) & Rank \== 5 &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

/* ------------------------------------------------------------------------- */

@hintPlayableCardColor1[priority(3.0)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardRank1[priority(3.1)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardColor2[priority(3.2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardRank2[priority(3.3)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardColor3[priority(3.4)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardRank3[priority(3.5)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardColor4[priority(3.6)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

@hintPlayableCardRank4[priority(3.7)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    has_card_color(Player, Focus, Color) &
    has_card_rank(Player, Focus, Rank) &
    playable(Color, Rank) &
    unhinted(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Focus).

/* ------------------------------------------------------------------------- */

@playPlayableCard[priority(4)]
+?action(play_card(Slot)) :
    my_name(Me) & slot(Slot) &
    has_card_color(Me, Slot, Color) &
    has_card_rank(Me, Slot, Rank) &
    playable(Color, Rank).

/* ------------------------------------------------------------------------- */

@reiterateColorHintOnPlayableCard1[priority(5.0)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnPlayableCard1[priority(5.1)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnPlayableCard2[priority(5.2)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnPlayableCard2[priority(5.3)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnPlayableCard3[priority(5.4)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnPlayableCard3[priority(5.5)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnPlayableCard4[priority(5.6)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnPlayableCard4[priority(5.7)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    playable(Color, Rank) &
    common_slots(Player, Rank, SlotList).

/* ------------------------------------------------------------------------- */

@discardUselessCard[priority(6)]
+?action(discard_card(Slot)) :
    spent_info_tokens &
    my_name(Me) &
    has_card_color(Me, Slot, Color) &
    has_card_rank(Me, Slot, Rank) &
    useless(Color, Rank).

/* ------------------------------------------------------------------------- */

@discardChop[priority(7)]
+?action(discard_card(C)) :
    spent_info_tokens &
    my_name(Me) &
    chop(Me, C).

/* ------------------------------------------------------------------------- */

@reiterateRankHintOnCriticalCard1[priority(8.0)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnCriticalCard1[priority(8.1)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnCriticalCard2[priority(8.2)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnCriticalCard2[priority(8.3)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnCriticalCard3[priority(8.4)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnCriticalCard3[priority(8.5)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateRankHintOnCriticalCard4[priority(8.6)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

@reiterateColorHintOnCriticalCard4[priority(8.7)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    critical(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList).

/* ------------------------------------------------------------------------- */

@reiterateColorHintOnEventuallyPlayableCard1[priority(9.0)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateRankHintOnEventuallyPlayableCard1[priority(9.1)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateColorHintOnEventuallyPlayableCard2[priority(9.2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateRankHintOnEventuallyPlayableCard2[priority(9.3)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateColorHintOnEventuallyPlayableCard3[priority(9.4)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateRankHintOnEventuallyPlayableCard3[priority(9.5)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateColorHintOnEventuallyPlayableCard4[priority(9.6)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateRankHintOnEventuallyPlayableCard4[priority(9.7)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    partially_hinted(Player, Slot, color) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList).

/* ------------------------------------------------------------------------- */

@reiterateTotalHintOnPlayableCard1[priority(10.0)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    totally_hinted(Player, Slot) &
    playable(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateTotalHintOnPlayableCard2[priority(10.1)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    totally_hinted(Player, Slot) &
    playable(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateTotalHintOnPlayableCard3[priority(10.2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    totally_hinted(Player, Slot) &
    playable(Color, Rank) &
    common_slots(Player, Color, SlotList).

@reiterateTotalHintOnPlayableCard4[priority(10.3)]
+?action(give_hint(Player, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    totally_hinted(Player, Slot) &
    playable(Color, Rank) &
    common_slots(Player, Color, SlotList).

/* ------------------------------------------------------------------------- */

@discardOldest[priority(17)]
+?action(discard_card(Slot)) :
    spent_info_tokens &
    my_name(Me) &
    ordered_slots(Me, [Slot|_]).

/* ------------------------------------------------------------------------- */

@hintOnEventuallyPlayableCard1[priority(18.0)]
+?action(give_hint(Player, color, Color, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard2[priority(18.1)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 1) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard3[priority(18.2)]
+?action(give_hint(Player, color, Color, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard4[priority(18.3)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 2) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard5[priority(18.4)]
+?action(give_hint(Player, color, Color, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard6[priority(18.5)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 3) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard7[priority(18.6)]
+?action(give_hint(Player, color, Color, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Color, SlotList) &
    focus(Player, SlotList, Slot).

@hintOnEventuallyPlayableCard8[priority(18.7)]
+?action(give_hint(Player, rank, Rank, SlotList)) :
    num_info_tokens(Tokens) & max_info_tokens(Tokens) &
    turns_ahead(Player, 4) &
    slot(Slot) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    unhinted(Color, Rank) &
    useful(Color, Rank) &
    common_slots(Player, Rank, SlotList) &
    focus(Player, SlotList, Slot).

/* ------------------------------------------------------------------------- */

@playOldest[priority(19)]
+?action(play_card(Slot)) :
    max_info_tokens(Tokens) &
    num_info_tokens(Tokens) &
    my_name(Me) &
    ordered_slots(Me, [Slot|_]).