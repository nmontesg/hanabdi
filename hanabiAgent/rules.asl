// This file includes the additional Prolog-like rules that operate on known
// facts and percets.

// No abducibles can be in the head of rules

has_playable_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack = Rank-1.

~has_playable_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack \== Rank-1.

has_critical_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    cards_per_rank(Rank, N) &
    discarded(Color, Rank, D) &
    D = N-1.

~has_critical_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    cards_per_rank(Rank, N) &
    discarded(Color, Rank, D) &
    D < N-1.

has_unplayed_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack < Rank.

has_useless_card(Player, Slot) :-
    player(Player) & slot(Slot) & color(Color) & rank(Rank) &
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack >= Rank.

// difference in turns between myself and another player
// when the other player is ahead of me
turns_ahead(Player, N) :-
    my_name(Me) & player(Player) &
    turn_number(Me, M) & turn_number(Player, P) &
    P >= M & N = P-M.

// when I am ahead of the other player
turns_ahead(Player, N) :-
    my_name(Me) & player(Player) &
    turn_number(Me, M) & turn_number(Player, P) &
    P < M & num_players(NP) & N = P-M+NP.

// unhinted means that no positive explicit information has been conveyed
// by a hint on that card
unhinted_slot(Player, Slot) :-
    player(Player) & slot(Slot) &
    not has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    not has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

unhinted_card(Color, Rank) :-
    player(Player) & slot(Slot) &
    has_card_color(Player, Slot, Color) [source(percept)] &
    has_card_rank(Player, Slot, Rank) [source(percept)] &
    not has_card_color(Player, Slot, Color) [hint_id(_), source(hint)] &
    not has_card_rank(Player, Slot, Rank) [hind_id(_), source(hint)].

// partially hinted means that a hint has provided either the color or the
// rank of the card
partially_hinted_slot(Player, Slot) :-
    player(Player) & slot(Slot) &
    not has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

partially_hinted_slot(Player, Slot) :-
    player(Player) & slot(Slot) &
    has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    not has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

// totally hinted means that both the color and rank of a card have been
// conveyed through a hint
totally_hinted_slot(Player, Slot) :-
    player(Player) & slot(Slot) &
    has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].




unhinted_card(Color, Rank) :-
    not has_card_color(Player, Slot, Color) [source(hint)] &
    not has_card_rank(Player, Slot, Rank) [source(hint)].

partially_hinted_card(Color, Rank) :-
    has_card_color(Player, Slot, Color) [source(hint)] &
    not has_card_rank(Player, Slot, Rank) [source(hint)].

partially_hinted_card(Color, Rank) :-
    not has_card_color(Player, Slot, Color) [source(hint)] &
    has_card_rank(Player, Slot, Rank) [source(hint)].

totally_hinted_card(Color, Rank) :-
    has_card_color(Player, Slot, Color) [source(hint)] &
    has_card_rank(Player, Slot, Rank) [source(hint)].




// the chop position for a player is the oldest unhinted slot
chop(Player, Chop) :-
    player(Player) & ordered_slots(Player, OrderedSlots) &
    oldest_unhinted_slot(Player, OrderedSlots, Chop).

oldest_unhinted_slot(Player, [H|_], H) :-
    unhinted_slot(Player, H).
oldest_unhinted_slot(Player, [H|T], E) :-
    not unhinted_slot(Player, H) &
    oldest_unhinted_slot(Player, T, E).

// there are available info token and some are spent (so discard is available)
available_info_tokens :- num_info_tokens(Tokens) & Tokens > 0.
spent_info_tokens :- num_info_tokens(Tokens) & max_info_tokens(Total) & Tokens < Total.
