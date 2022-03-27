common_slots(Player, Rank, []) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [2]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [3]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [4]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,2]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,3]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,4]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [2,3]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [2,4]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [3,4]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,2,3]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,2,4]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,3,4]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [2,3,4]) :-
    cards_per_player(4) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).

common_slots(Player, Rank, [1,2,3,4]) :-
    cards_per_player(4) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank).


/* ------------------------------------------------------*/



common_slots(Player, Rank, []) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [3]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [4]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,3]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,4]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,3]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,4]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [3,4]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [3,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [4,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,3]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,4]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,3,4]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,3,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,3,4]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,3,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [3,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,3,4]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    ~has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,3,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    ~has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    ~has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,3,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    ~has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [2,3,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    ~has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).

common_slots(Player, Rank, [1,2,3,4,5]) :-
    cards_per_player(5) & rank(Rank) &
    has_card_rank(Player, 1, Rank) &
    has_card_rank(Player, 2, Rank) &
    has_card_rank(Player, 3, Rank) &
    has_card_rank(Player, 4, Rank) &
    has_card_rank(Player, 5, Rank).
