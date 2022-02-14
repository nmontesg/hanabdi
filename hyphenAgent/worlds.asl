// in principle, my card may take any color or rank
has_card_color(Me, Slot, Color) :- .my_name(Me) & slot(Slot) & color(Color).
has_card_rank(Me, Slot, Rank) :- .my_name(Me) & slot(Slot) & rank(Rank).

abduced :- true.

has_playable_card(Me, Slot) :-
    .my_name(Me) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack = Rank-1.