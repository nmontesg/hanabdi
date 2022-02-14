// The sole purpose of the game_master agent is to create the agents
// who will act as players in the game

!create_agents.
ready_agents(0).

@createAgents
+!create_agents : true
    <- .findall(Name, player(Name), PlayerList);
    ?cards_per_player(N);
    .findall(X, .range(X, 1, N), SlotList);
    for ( .member(Ag, PlayerList) ) {
        .create_agent(Ag, "player_main.asl", [agentClass("custom.HanabiAgent")]);
        +ordered_slots(Ag, SlotList);
    }
    .broadcast(achieve, get_ready).

// This needs to be atomic so the ready_agents(N) variable is updated correctly
@getReadyReply[atomic]
+ready : true
    <- ?ready_agents(N);
    -+ready_agents(N+1).

@startGame
+ready_agents(N) : num_players(N) <- start_game.

+!update_slots(_) : true.

+!kqml_received(KQML_Sender_Var, publicAction, _, KQML_MsgId) : true.
