// This file includes the additional Prolog-like rules that operate on known
// facts and percets.

// No abducibles can be in the head of rules

~has_card_color(Player, Slot, C1) :-
    color(C1) & has_card_color(Player, Slot, C2) & C2 \== C1.

~has_card_rank(Player, Slot, R1) :-
    rank(R1) & has_card_rank(Player, Slot, R2) & R2 \== R1.

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

// find the closest player (in terms of turns ahead) who has a playable
// card that has not been hinted, and select among all of their card that are
// playable and are unhinted, the oldest one
closest_player_with_oldest_playable_unhinted_card(Player, Slot) :-
    closest_player_with_unhinted_playable_card(Player) &
    oldest_unhinted_playable_slot(Player, Slot).

has_playable_unhinted_card(Player, Slot) :-
    has_playable_card(Player, Slot) &
    unhinted(Player, Slot).

closest_player_with_unhinted_playable_card(Player) :-
    iterate_through_players(1, Player).

iterate_through_players(N, Player) :-
    turns_ahead(Player, N) &
    has_playable_unhinted_card(Player, _).
iterate_through_players(N, Player) :-
    turns_ahead(PlayerPrime, N) &
    not has_playable_unhinted_card(PlayerPrime, _) &
    iterate_through_players(N+1, Player).

oldest_unhinted_playable_slot(Player, Slot) :-
    ordered_slots(Player, OrderedSlots) &
    iterate_through_slots(Player, OrderedSlots, Slot).

iterate_through_slots(Player, [H|_], H) :-
    has_playable_unhinted_card(Player, H).
iterate_through_slots(Player, [H|T], E) :-
    not has_playable_unhinted_card(Player, H) &
    iterate_through_slots(Player, T, E).

// there are available info token and some are spent (so discard is available)
available_info_tokens :- num_info_tokens(N) & N > 0.
spent_info_tokens :- num_info_tokens(N) & max_info_tokens(Total) & N < Total.
