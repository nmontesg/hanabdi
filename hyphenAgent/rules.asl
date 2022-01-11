// This file includes the additional Prolog-like rules that operate on known
// facts and percets.

// No abducibles can be in the head of rules

~has_card_color(Player, Slot, C1) :-
    color(C1) &
    has_card_color(Player, Slot, C2) &
    C2 \== C1.

~has_card_rank(Player, Slot, R1) :-
    rank(R1) &
    has_card_rank(Player, Slot, R2) &
    R2 \== R1.

has_playable_card(Player, Slot) :-
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    stack(Color, Rank-1).

has_critical_card(Player, Slot) :-
    has_card_color(Player, Slot, Color) &
    has_card_rank(Player, Slot, Rank) &
    cards_per_rank(Rank, N) &
    discarded(Color, Rank, N-1).

// difference in turns between myself and another player
// when the other player is ahead of me
turns_ahead(Player, N) :-
    my_name(Me) &
    player(Player) &
    turn_number(Me, M) &
    turn_number(Player, P) &
    P > M &
    N = P - M.

// when I am ahead of the other player
turns_ahead(Player, N) :-
    my_name(Me) &
    player(Player) &
    turn_number(Me, M) &
    turn_number(Player, P) &
    P < M &
    num_players(NP) &
    N = P - M + NP.

// unhinted means that no positive explicit information has been conveyed
// by a hint on that card
unhinted(Player, Slot) :-
    player(Player) &
    slot(Slot) &
    not has_card_color(Player, Slot, _) [hint_id(_), source(hint)] &
    not has_card_rank(Player, Slot, _) [hint_id(_), source(hint)].

chop(Player, Chop) :-
    player(Player) &
    ordered_slots(Player, OrderedSlots) &
    .findall(S, ( .member(S, OrderedSlots) & unhinted(Player, S) ), UnhintedSlots) &
    .findall(Pos, ( .member(M, UnhintedSlots) & .nth(Pos, OrderedSlots, M) ), List) &
    .min(List, Min) & .nth(Min, OrderedSlots, Chop).
