// The sole purpose of the game_master agent is to create the agents
// who will act as players in the game

!create_agents.
ready_agents(0).

@createAgents
+!create_agents : true
    <- .findall(Name, player(Name), PlayerList);
    for ( .member(Ag, PlayerList) ) {
        .create_agent(Ag, "player_main.asl");
    }
    .broadcast(achieve, get_ready).

// This needs to be atomic so the ready_agents(N) variable is updated correctly
@getReadyReply[atomic]
+ready : true
    <- ?ready_agents(N);
    -+ready_agents(N+1).

@startGame
+ready_agents(N) : num_players(N)
    <- start_game;
    // sacrifice for the greater good
    .kill_agent(game_master).