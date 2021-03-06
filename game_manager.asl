// The sole purpose of the game_master agent is to create the agents
// who will act as players in the game

!create_agents.
ready_agents(0).

@createAgents
+!create_agents : true
    <- ?seed(S);
    .set_random_seed(S);
    .findall(Name, player(Name), PlayerList);
    ?cards_per_player(N);
    .findall(X, .range(X, 1, N), SlotList);
    for ( .member(Ag, PlayerList) ) {
        .create_agent(Ag, "hanabiAgent/main.asl", [agentClass("hanabiAgent.HanabiAgent")]);
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
+!remove_hint_info(_, _) : true.
+!kqml_received(_, publicAction, _, _) : true.
