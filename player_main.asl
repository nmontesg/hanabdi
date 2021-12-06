{ include("hyphenAgent/basic.asl") }
{ include("hyphenAgent/clues.asl") }


/* ---------- Plans to debug ---------- */

+player_turn(1) : .my_name(Me) & turn_number(Me,1)
    <- !give_hint(bob, color, blue).

+player_turn(2) : .my_name(Me) & turn_number(Me,2)
    <- !play_card(2).

+player_turn(3) : .my_name(Me) & turn_number(Me,3)
    <- !play_card(1).
