unique_visible_card(Color, Rank, alice, 1) :-
    num_players(5) & color(Color) & rank(Rank) &
    has_card_color(alice, 1, Color) & has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, alice, 2) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    has_card_color(alice, 2, Color) & has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, alice, 3) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    has_card_color(alice, 3, Color) & has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, alice, 4) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    has_card_color(alice, 4, Color) & has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, bob, 1) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    has_card_color(bob, 1, Color) & has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, bob, 2) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    has_card_color(bob, 2, Color) & has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, bob, 3) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    has_card_color(bob, 3, Color) & has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, bob, 4) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    has_card_color(bob, 4, Color) & has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, cathy, 1) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    has_card_color(cathy, 1, Color) & has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, cathy, 2) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    has_card_color(cathy, 2, Color) & has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, cathy, 3) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    has_card_color(cathy, 3, Color) & has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, cathy, 4) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    has_card_color(cathy, 4, Color) & has_card_rank(cathy, 4, Rank) &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, donald, 1) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    has_card_color(donald, 1, Color) & has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, donald, 2) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    has_card_color(donald, 2, Color) & has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, donald, 3) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    has_card_color(donald, 3, Color) & has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, donald, 4) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    has_card_color(donald, 4, Color) & has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, emma, 1) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    has_card_color(emma, 1, Color) & has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, emma, 2) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    has_card_color(emma, 2, Color) & has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, emma, 3) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    has_card_color(emma, 3, Color) & has_card_rank(emma, 3, Rank) &
    ~has_card_color(emma, 4, Color) & ~has_card_rank(emma, 4, Rank).

unique_visible_card(Color, Rank, emma, 4) :-
    num_players(5) & color(Color) & rank(Rank) &
    ~has_card_color(alice, 1, Color) & ~has_card_rank(alice, 1, Rank) &
    ~has_card_color(alice, 2, Color) & ~has_card_rank(alice, 2, Rank) &
    ~has_card_color(alice, 3, Color) & ~has_card_rank(alice, 3, Rank) &
    ~has_card_color(alice, 4, Color) & ~has_card_rank(alice, 4, Rank) &
    ~has_card_color(bob, 1, Color) & ~has_card_rank(bob, 1, Rank) &
    ~has_card_color(bob, 2, Color) & ~has_card_rank(bob, 2, Rank) &
    ~has_card_color(bob, 3, Color) & ~has_card_rank(bob, 3, Rank) &
    ~has_card_color(bob, 4, Color) & ~has_card_rank(bob, 4, Rank) &
    ~has_card_color(cathy, 1, Color) & ~has_card_rank(cathy, 1, Rank) &
    ~has_card_color(cathy, 2, Color) & ~has_card_rank(cathy, 2, Rank) &
    ~has_card_color(cathy, 3, Color) & ~has_card_rank(cathy, 3, Rank) &
    ~has_card_color(cathy, 4, Color) & ~has_card_rank(cathy, 4, Rank) & &
    ~has_card_color(donald, 1, Color) & ~has_card_rank(donald, 1, Rank) &
    ~has_card_color(donald, 2, Color) & ~has_card_rank(donald, 2, Rank) &
    ~has_card_color(donald, 3, Color) & ~has_card_rank(donald, 3, Rank) &
    ~has_card_color(donald, 4, Color) & ~has_card_rank(donald, 4, Rank) &
    ~has_card_color(emma, 1, Color) & ~has_card_rank(emma, 1, Rank) &
    ~has_card_color(emma, 2, Color) & ~has_card_rank(emma, 2, Rank) &
    ~has_card_color(emma, 3, Color) & ~has_card_rank(emma, 3, Rank) &
    has_card_color(emma, 4, Color) & has_card_rank(emma, 4, Rank).