common_slots(Player, Color, []) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [1]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [2]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [3]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [4]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,2]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,3]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,4]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [2,3]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [2,4]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [3,4]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,2,3]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,2,4]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,3,4]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [2,3,4]) :-
    cards_per_player(4) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).

common_slots(Player, Color, [1,2,3,4]) :-
    cards_per_player(4) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color).


/* ------------------------------------------------------*/



common_slots(Player, Color, []) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [2]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [3]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [4]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,3]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,4]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,3]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,4]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [3,4]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [3,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [4,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).


common_slots(Player, Color, [1,2,3]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,4]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,3,4]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,3,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,4,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,3,4]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,3,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,4,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [3,4,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,3,4]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    ~has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,3,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    ~has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,4,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    ~has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,3,4,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    ~has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [2,3,4,5]) :-
    cards_per_player(5) & color(Color) &
    ~has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).

common_slots(Player, Color, [1,2,3,4,5]) :-
    cards_per_player(5) & color(Color) &
    has_card_color(Player, 1, Color) &
    has_card_color(Player, 2, Color) &
    has_card_color(Player, 3, Color) &
    has_card_color(Player, 4, Color) &
    has_card_color(Player, 5, Color).
