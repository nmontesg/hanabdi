{ include("hyphenAgent/actions.asl") }
{ include("hyphenAgent/tom.asl") }
{ include("hyphenAgent/rules.asl") }
{ include("hyphenAgent/strategy.asl") }
{ include("hyphenAgent/abduction.asl") }

/* ---------- Plan to initialize ordered slots for all players ---------- */

@getReady[atomic]
+!get_ready : true
    <- ?seed(Seed);
    .set_random_seed(Seed);
    .my_name(Me);
    +my_name(Me);
    ?cards_per_player(N);
    .findall(Ag, player(Ag), PlayerList);
    .findall(X, .range(X, 1, N), SlotList);
    for ( .member(P, PlayerList) ) {
        +ordered_slots(P, SlotList);
    }
    .send(game_master, tell, ready).

/* ---------- Plans to debug ---------- */

/*
+player_turn(1) : my_name(Me) & turn_number(Me,1)
    <- !give_hint(bob, color, white);
    !adopt_perspective([cathy, Me]);
    custom.remove_beliefs;
    custom.recover_beliefs.
*/

/*
+player_turn(2) : .my_name(Me) & turn_number(Me,2)
    <- .findall(B, believes(alice, B, 2), BList);
    for ( .member(M, BList) ) {
        .print(M);
    }.
*/

/*
+player_turn(3) : .my_name(Me) & turn_number(Me,3)
    <- .findall(has_card_color(W,S,C), believes(alice, has_card_color(W,S,C), 1), BList);
    for ( .member(M, BList) ) {
        .print(M);
    }.
*/