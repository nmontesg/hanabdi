/* ------------------------------------------------*/

@hintCriticalFive1[priority(1)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 5) &
    unhinted_slot(HintedPlayer, Slot).

@hintCriticalCard1[priority(2)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_critical_card(HintedPlayer, Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    unhinted_card(Color, Rank).

@hintTwoOnChop1[priority(3)]
+?action(give_gint(HintedPlayer, rank, 2)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 2) &
    has_card_color(HintedPlayer, Slot, Color) &
    unhinted_card(Color, 2).

/* ------------------------------------------------*/

@hintCriticalFive2[priority(4)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 5) &
    unhinted_slot(HintedPlayer, Slot).

@hintCriticalCard2[priority(5)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    chop(HintedPlayer, Slot) &
    has_critical_card(HintedPlayer, Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    unhinted_card(Color, Rank).

@hintTwoOnChop2[priority(6)]
+?action(give_gint(HintedPlayer, rank, 2)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 2) &
    has_card_color(HintedPlayer, Slot, Color) &
    unhinted_card(Color, 2).

/* ------------------------------------------------*/

@hintCriticalFive3[priority(7)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 5) &
    unhinted_slot(HintedPlayer, Slot).

@hintCriticalCard3[priority(8)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    chop(HintedPlayer, Slot) &
    has_critical_card(HintedPlayer, Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    unhinted_card(Color, Rank).

@hintTwoOnChop3[priority(9)]
+?action(give_gint(HintedPlayer, rank, 2)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 2) &
    has_card_color(HintedPlayer, Slot, Color) &
    unhinted_card(Color, 2).

/* ------------------------------------------------*/

@hintCriticalFive4[priority(10)]
+?action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 5) &
    unhinted_slot(HintedPlayer, Slot).

@hintCriticalCard4[priority(11)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    chop(HintedPlayer, Slot) &
    has_critical_card(HintedPlayer, Slot) &
    has_card_color(HintedPlayer, Slot, Color) &
    has_card_rank(HintedPlayer, Slot, Rank) &
    unhinted_card(Color, Rank).

@hintTwoOnChop4[priority(12)]
+?action(give_gint(HintedPlayer, rank, 2)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    chop(HintedPlayer, Slot) &
    has_card_rank(HintedPlayer, Slot, 2) &
    has_card_color(HintedPlayer, Slot, Color) &
    unhinted_card(Color, 2).

/* ------------------------------------------------*/

@playPlayableCard[priority(13)]
+?action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

/* ------------------------------------------------*/

@hintPlayableCard11[priority(14)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    ordered_slots(HintedPlayer, [Slot1|_]) &
    has_playable_card(HintedPlayer, Slot1) &
    has_card_color(HintedPlayer, Slot1, Color).

@hintPlayableCard12[priority(15)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    ordered_slots(HintedPlayer, [Slot1|[Slot2|_]]) &
    ~has_playable_card(HintedPlayer, Slot1) &
    has_playable_card(HintedPlayer, Slot2) &
    has_card_color(HintedPlayer, Slot2, Color).

@hintPlayableCard13[priority(16)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    ordered_slots(HintedPlayer, [Slot1|[Slot2|[Slot3|_]]]) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    has_playable_card(HintedPlayer, Slot3) &
    has_card_color(HintedPlayer, Slot3, Color).

@hintPlayableCard14[priority(17)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    ordered_slots(HintedPlayer, [Slot1|[Slot2|[Slot3|[Slot4|_]]]]) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    has_playable_card(HintedPlayer, Slot4) &
    has_card_color(HintedPlayer, Slot4, Color).
/*
@hintPlayableCard15[priority(18)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    cards_per_player(P) & P = 5 &
    ordered_slots(HintedPlayer, [Slot1|[Slot2|[Slot3|[Slot4|[Slot5|_]]]]]) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    ~has_playable_card(HintedPlayer, Slot4) &
    has_playable_card(HintedPlayer, Slot5) &
    has_card_color(HintedPlayer, Slot5, Color).

/* ------------------------------------------------*/
/*
@hintPlayableCard21[priority(19)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    has_playable_card(HintedPlayer, Slot1) &
    has_card_color(HintedPlayer, Slot1, Color).

@hintPlayableCard22[priority(20)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    ~has_playable_card(HintedPlayer, Slot1) &
    has_playable_card(HintedPlayer, Slot2) &
    has_card_color(HintedPlayer, Slot2, Color).

@hintPlayableCard23[priority(21)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    has_playable_card(HintedPlayer, Slot3) &
    has_card_color(HintedPlayer, Slot3, Color).

@hintPlayableCard24[priority(22)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    .nth(3, OrderedSlots, Slot4) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    has_playable_card(HintedPlayer, Slot4) &
    has_card_color(HintedPlayer, Slot4, Color).

@hintPlayableCard25[priority(23)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 2) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    num_players(P) & P < 4 &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    .nth(3, OrderedSlots, Slot4) &
    .nth(4, OrderedSlots, Slot5) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    ~has_playable_card(HintedPlayer, Slot4) &
    has_playable_card(HintedPlayer, Slot5) &
    has_card_color(HintedPlayer, Slot5, Color).
*/
/* ------------------------------------------------*/
/*
@hintPlayableCard31[priority(24)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    has_playable_card(HintedPlayer, Slot1) &
    has_card_color(HintedPlayer, Slot1, Color).

@hintPlayableCard32[priority(25)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    ~has_playable_card(HintedPlayer, Slot1) &
    has_playable_card(HintedPlayer, Slot2) &
    has_card_color(HintedPlayer, Slot2, Color).

@hintPlayableCard33[priority(26)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    has_playable_card(HintedPlayer, Slot3) &
    has_card_color(HintedPlayer, Slot3, Color).

@hintPlayableCard34[priority(27)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 3) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    .nth(3, OrderedSlots, Slot4) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    has_playable_card(HintedPlayer, Slot4) &
    has_card_color(HintedPlayer, Slot4, Color).
*/
/* ------------------------------------------------*/
/*
@hintPlayableCard41[priority(28)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    has_playable_card(HintedPlayer, Slot1) &
    has_card_color(HintedPlayer, Slot1, Color).

@hintPlayableCard42[priority(29)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    ~has_playable_card(HintedPlayer, Slot1) &
    has_playable_card(HintedPlayer, Slot2) &
    has_card_color(HintedPlayer, Slot2, Color).

@hintPlayableCard43[priority(30)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    has_playable_card(HintedPlayer, Slot3) &
    has_card_color(HintedPlayer, Slot3, Color).

@hintPlayableCard44[priority(31)]
+?action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 4) &
    ordered_slots(HintedPlayer, OrderedSlots) &
    .nth(0, OrderedSlots, Slot1) &
    .nth(1, OrderedSlots, Slot2) &
    .nth(2, OrderedSlots, Slot3) &
    .nth(3, OrderedSlots, Slot4) &
    ~has_playable_card(HintedPlayer, Slot1) &
    ~has_playable_card(HintedPlayer, Slot2) &
    ~has_playable_card(HintedPlayer, Slot3) &
    has_playable_card(HintedPlayer, Slot4) &
    has_card_color(HintedPlayer, Slot4, Color).
*/