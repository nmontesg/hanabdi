@promptColor[priority(2.4)]
+?action(give_hint(P2, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(P1, 1) &
    chop(P1, Chop) &
    has_card_color(P1, Chop, Color) &
    has_card_rank(P1, Chop, Rank) &
    playable(Color, Rank) &
    turns_ahead(P2, 2) &
    has_card_color(P2, Focus, Color) &
    has_card_rank(P2, Focus, Rank+1) &
    unhinted(Color, Rank+1) &
    common_slots(P2, Color, SlotList) &
    focus(P2, SlotList, Focus).

@promptRank[priority(2.5)]
+?action(give_hint(P2, rank, Rank+1, SlotList)) :
    available_info_tokens &
    turns_ahead(P1, 1) &
    chop(P1, Chop) &
    has_card_color(P1, Chop, Color) &
    has_card_rank(P1, Chop, Rank) &
    playable(Color, Rank) &
    turns_ahead(P2, 2) &
    has_card_color(P2, Focus, Color) &
    has_card_rank(P2, Focus, Rank+1) &
    unhinted(Color, Rank+1) &
    common_slots(P2, Rank+1, SlotList) &
    focus(P2, SlotList, Focus).

@finesseColor[priority(2.6)]
+?action(give_hint(P2, color, Color, SlotList)) :
    available_info_tokens &
    turns_ahead(P1, 1) &
    has_card_color(P1, S, Color) &
    has_card_rank(P1, S, Rank) &
    playable(Color, Rank) &
    partially_hinted(P1, S, _) &
    turns_ahead(P2, 2) &
    has_card_color(P2, Focus, Color) &
    has_card_rank(P2, Focus, Rank+1) &
    unhinted(Color, Rank+1) &
    common_slots(P2, Color, SlotList) &
    focus(P2, SlotList, Focus).

@finesseRank[priority(2.7)]
+?action(give_hint(P2, rank, Rank+1, SlotList)) :
    available_info_tokens &
    turns_ahead(P1, 1) &
    has_card_color(P1, S, Color) &
    has_card_rank(P1, S, Rank) &
    playable(Color, Rank) &
    partially_hinted(P1, S, _) &
    turns_ahead(P2, 2) &
    has_card_color(P2, Focus, Color) &
    has_card_rank(P2, Focus, Rank+1) &
    unhinted(Color, Rank+1) &
    common_slots(P2, Rank+1, SlotList) &
    focus(P2, SlotList, Focus).