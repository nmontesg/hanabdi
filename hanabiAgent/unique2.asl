unique_visible_card(Color, Rank, alice, 1) :-
    num_players(2) & color(Color) & rank(Rank) &
    has_card_color(alice, 1, Color) & has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, alice, 2) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    has_card_color(alice, 2, Color) & has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, alice, 3) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    has_card_color(alice, 3, Color) & has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, alice, 4) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    has_card_color(alice, 4, Color) & has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, alice, 5) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    has_card_color(alice, 5, Color) & has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, bob, 1) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    has_card_color(bob, 1, Color) & has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, bob, 2) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    has_card_color(bob, 2, Color) & has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, bob, 3) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    has_card_color(bob, 3, Color) & has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, bob, 4) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    has_card_color(bob, 4, Color) & has_card_rank(bob, 4, Rank) &
    ~has_card_color(bob, 5, Color) & ~has_card_rank(bob, 5, Rank).

unique_visible_card(Color, Rank, bob, 5) :-
    num_players(2) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(alice, 5, Color) & ~has_card_rank(alice, 5, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    has_card_color(bob, 5, Color) & has_card_rank(bob, 5, Rank).
