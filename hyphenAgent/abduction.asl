// ABD(T_{i,j,...,k,l}, S, a_l) obtains the set of abducible atoms from 
// T_{i,j,...,k} \models abducible(F).

abducible(has_card_color(Me, Slot, Color)) :-
    my_name(Me) & slot(Slot) & color(Color) &
    not has_card_color(Me, Slot, _).

abducible(has_card_color(Me, Slot, Rank)) :-
    my_name(Me) & slot(Slot) & rank(Rank) &
    not has_card_rank(Me, Slot, _).

// integrity constraints

false :-
    player(P) & slot(S) & color(C1) & color(C2) & C1 \== C2 &
    has_card_color(P, S, C1) & has_card_color(P, S, C2).

false :-
    player(P) & slot(S) & rank(R1) & rank(R2) & R1 \== R2 &
    has_card_rank(P, S, R1) & has_card_rank(P, S, R2).

false :-
    player(P) & slot(S) & color(C) &
    has_card_color(P, S, C) & ~has_card_color(P, S, C).

false :-
    player(P) & slot(S) & rank(R) &
    has_card_rank(P, S, R) & ~has_card_rank(P, S, R).
