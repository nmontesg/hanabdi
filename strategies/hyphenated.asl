@hintCriticalCard1
+!action(give_hint(HintedPlayer, rank, 5)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Chop) &
    has_card_rank(HintedPlayer, Chop, 5).

@hintCriticalCard2
+!action(give_hint(HintedPlayer, color, Color)) :
    available_info_tokens &
    turns_ahead(HintedPlayer, 1) &
    chop(HintedPlayer, Chop) &
    has_card_color(HintedPlayer, Chop, Color) &
    has_critical_card(HintedPlayer, Chop).


