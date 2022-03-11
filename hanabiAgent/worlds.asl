// Find instantiations of formulas that are possible given the current
// knowledge, the integrity constraints and the abduced knowledge.

possible([H]) :-
    .length([H], 1) &
    .assertz(H [temp]) &
    not ic &
    .abolish(H [temp]).

possible([H]) :-
    .length([H], 1) &
    .assertz(H [temp]) &
    ic &
    .abolish(H [temp]) &
    .fail.

possible([H|T]) :-
    .length([H|T], N) & N > 1 &   
    .assertz(H [temp]) &
    not ic &
    possible(T) &
    .abolish(H [temp]).

possible([H|T]) :-
    .length([H|T], N) & N > 1 &
    .assertz(H [temp]) &
    not ic &
    not possible(T) &
    .abolish(H [temp]) &
    .fail.

possible([H|T]) :-
    .length([H|T], N) & N > 1 &
    .assertz(H [temp]) &
    ic &
    .abolish(H [temp]) &
    .fail.

// TODO: delete below plan after debugging

+player_turn(Me) : .my_name(Me) & turn_number(Me, 2) & logic_program([Me])
    <- .time(H1, M1, S1, MS1);
    .setof(
        has_card(Me, 1, C1, R1),
        color(C1) & rank(R1) & possible([has_card_color(Me, 1, C1), has_card_rank(Me, 1, R1)]),
        // possible([has_card_color(Me, 1, blue), has_card_rank(Me, 1, R)]),
        L);
    .time(H2, M2, S2, MS2);
    !print_list(L);
    .print("Query time: ", (H2-H1)*60*60 + (M2-M1)*60 + (S2-S1) + (MS2-MS1)/1000).
