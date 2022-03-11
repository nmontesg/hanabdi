// This file includes the additional Prolog-like rules that operate on known
// facts and percets.

// No abducibles can be in the head of rules (?)

~has_card_color(Player, Slot, C1) :-
    player(Player) & slot(Slot) & color(C1) & color(C2) & C1 \== C2 &
    has_card_color(Player, Slot, C2).

~has_card_rank(Player, Slot, R1) :-
    player(Player) & slot(Slot) & rank(R1) & rank(R2) & R1 \== R2 &
    has_card_rank(Player, Slot, R2).

has_playable_card(Player, Slot) :-
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Stack) &
    Stack = Rank-1.

has_critical_card(Player, Slot) :-
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    cards_per_rank(Rank, N) &
    discarded(Color, Rank, D) &
    D = N-1.

has_discardable_card(Player, Slot) :-
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
unhinted(Player, Slot) :-
    player(Player) & slot(Slot) &
    not has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    not has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

// the chop position for a player is the oldest unhinted slot
chop(Player, Chop) :-
    player(Player) & ordered_slots(Player, OrderedSlots) &
    oldest_unhinted_slot(Player, OrderedSlots, Chop).

oldest_unhinted_slot(Player, [H|_], H) :-
    unhinted(Player, H).
oldest_unhinted_slot(Player, [H|T], E) :-
    not unhinted(Player, H) &
    oldest_unhinted_slot(Player, T, E).

// there are available info token and some are spent (so discard is available)
available_info_tokens :- num_info_tokens(N) & N > 0.
spent_info_tokens :- num_info_tokens(Tokens) & max_info_tokens(Total) & Tokens < Total.

// number of cards that have been disclosed to me EXCEPT the identity of the 
// card of Player at position Slot
disclosed_cards(Color, Rank, Player, Slot, N) :-
    color(Color) & rank(Rank) & player(Player) & slot(Slot) &
    .findall(
        has_card(P, S, Color, Rank),
        has_card_color(P, S, Color) & has_card_rank(P, S, Rank) & slot(S) & P \== Player,
        L1
    ) & .length(L1, N1) &
    .findall(
        has_card(Player, S, Color, Rank),
        has_card_color(Player, S, Color) & has_card_rank(Player, S, Rank) & S \== Slot,
        L2
    ) & .length(L2, N2) &
    discarded(Color, Rank, N3) &
    card_in_stack(Color, Rank, N4) &
    N = N1 + N2 + N3 + N4.

card_in_stack(Color, Rank, 0) :- stack(Color, Stack) & Stack < Rank.
card_in_stack(Color, Rank, 1) :- stack(Color, Stack) & Stack >= Rank.
