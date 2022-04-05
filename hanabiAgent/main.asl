{ include("hanabiAgent/actions.asl") }
{ include("hanabiAgent/select.asl") }
{ include("hanabiAgent/tom.asl") }
{ include("hanabiAgent/abduction.asl") }
{ include("hanabiAgent/common_slots_color.asl") }
{ include("hanabiAgent/common_slots_rank.asl") }

/* ---------- Plan to initialize ordered slots for all players ---------- */

@getReady[atomic]
+!get_ready : true
    <- ?seed(Seed);
    .set_random_seed(Seed);
    .my_name(Me);
    +my_name(Me);
    +logic_program([Me]);
    +abd_id(1);
    ?cards_per_player(N);
    .findall(Ag, player(Ag), PlayerList);
    .findall(X, .range(X, 1, N), SlotList);
    for ( .member(P, PlayerList) ) {
        +ordered_slots(P, SlotList);
    }
    ?strategy_file(Path);
    .include(Path);
    .send(game_manager, tell, ready).

/* ---------- Auxiliary ---------- */

@printList[atomic]
+!print_list(L) : true
    <- for ( .member(M, L) ) { .print(M); }
    .print("\n").

/* ---------- Plans to debug ---------- */
