{ include("hanabiAgent/actions.asl") }
{ include("hanabiAgent/rules.asl") }
{ include("hanabiAgent/select.asl") }
{ include("hanabiAgent/tom.asl") }
{ include("hanabiAgent/abduction.asl") }

// TODO: have the asl file with the particular strategy as an input (command-line
// argument). Make repository of rule-based strategies
{ include("hanabiAgent/strategy.asl") }

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
    .send(game_master, tell, ready).

/* ---------- Auxiliary ---------- */

@printList[atomic]
+!print_list(L) : true
    <- for ( .member(M, L) ) { .print(M); }
    .print("\n").

/* ---------- Plans to debug ---------- */
