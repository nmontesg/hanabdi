// Agent hyphen_agent in project hanabdi

/* Initial beliefs and rules */


/* Initial goals */


/* Plans */

/* ---------- Plans to set up the game ---------- */

@setup[atomic]
+player_turn(MyTurn) : my_turn_number(MyTurn) & game_stage(setup)
    <- .my_name(Me);
    .broadcast(tell,turn_number(Me,MyTurn));
    +ordered_slots(Me,[]);
    ?cards_per_player(N);
    .all_names(All);
    for ( .range(S,1,N) ) {
        draw_random_card(S);
        .send(All,tell,placed_card(S));
    }
    ?num_players(P);
    if ( MyTurn == P ) {
        change_game_stage(earlyGame);
    }
    finish_turn;
    .

@process_turn_number[atomic]
+turn_number(Player,N) [source(Player)] : true
    <- .print("received turn number from ",Player,"-",N);
    +ordered_slots(Player,[]);
    .

/* ---------- Plans to process actions by other players ---------- */

@process_picked_card[atomic]
+placed_card(S) [source(Source)] : true
    <- if ( Source == self ) {
        .my_name(Player);
    } else {
        Player = Source;
    }
    ?ordered_slots(Player,L);
    .concat(L,[S],Lprime);
    -+ordered_slots(Player,Lprime);
    -placed_card(S) [source(Source)];
    .

@process_took_card[atomic]
+took_card(S) [source(Source)] : true
    <- if ( Source == self ) {
        .my_name(Player);
    } else {
        Player = Source;
    }
    ?ordered_slots(Player,L);
    .nth(N,L,S);
    .delete(N,L,Lprime);
    -+ordered_slots(Player,Lprime);
    -took_card(S) [source(Source)];
    // update beliefs related to that card
    // IMPORTANT: Only the information coming from HINTS
    -has_card_color(Player,S,_) [hint_by(_),hint_id(_),source(self)];
    -~has_card_color(Player,S,_) [hint_by(_),hint_id(_),source(self)];
    -has_card_rank(Player,S,_) [hint_by(_),hint_id(_),source(self)];
    -~has_card_rank(Player,S,_) [hint_by(_),hint_id(_),source(self)];
    .


/* ---------- Plans for basic game actions ---------- */

@play_card[atomic]
+!play_card(Slot) : num_cards_deck(D)
    <- .all_names(All);
    play_card(Slot);
    .send(All,tell,took_card(Slot));
    if ( D > 0 ) {
        draw_random_card(Slot);
        .send(All,tell,placed_card(Slot));
    }
    finish_turn;
    .

@discard_card[atomic]
+!discard_card(Slot) : num_cards_deck(D)
    <- .all_names(All);
    discard_card(Slot);
    .send(All,tell,took_card(Slot));
    if ( D > 0 ) {
        draw_random_card(Slot);
        .send(All,tell,placed_card(Slot));
    }
    finish_turn;
    .

// plan to give hints: Mode is either color or rank
@give_hint[atomic]
+!give_hint(Player,Mode,Value) : true
    <- ?hint_id(Id);
    spend_info_token;
    if ( Mode == color ) {
        .findall(S,has_card_color(Player,S,Value) [source(percept)],L);
    } elif ( Mode == rank ) {
        .findall(S,has_card_rank(Player,S,Value) [source(percept)],L);
    }
    .my_name(Me);
    .all_names(All);
    .send(All,tell,hint(Id,Player,Mode,Value,L));
    finish_turn;
    .


/* ---------- Plans to process hints ---------- */

@process_hint[atomic]
+hint(Id,Player,Mode,Value,L) : true
    <- ?cards_per_player(N);
    .concat("has_card_",Mode,String);
    .term2string(Term,String);
    for ( .range(S,1,N) ) {
        Belief =.. [Term, [Player,S,Value], [hint_id(Id)]];
        if ( .member(S,L) ) {
            +Belief;
        } else {
            +(~Belief);
        }
    }
    .


/* ---------- Plans to debug ---------- */

// +game_stage(Stage) : true
//     <- .print("perceived change in stage to ",Stage);
//     .

+player_turn(MyTurn) : my_turn_number(MyTurn) & game_stage(earlyGame) & .my_name(alice)
    <- !give_hint(bob,rank,1);
    .

+player_turn(MyTurn) : my_turn_number(MyTurn) & game_stage(earlyGame) & .my_name(bob)
    <- !discard_card(3);
    .
