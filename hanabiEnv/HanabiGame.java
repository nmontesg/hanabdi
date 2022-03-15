package hanabiEnv;

import java.util.List;
import java.util.Random;
import java.util.Collections;
import jason.asSyntax.*;
import jason.environment.*;


public class HanabiGame extends Environment {
    private List<String> hanabiColors = List.of("red", "yellow", "green", "white", "blue");
    private List<Integer> cardsPerRank = List.of(3, 2, 2, 2, 1);
    private Random cardDealer = new Random();
    private int[][] deck = new int[5][5];

    private List<String> agents = List.of("alice", "bob", "cathy", "donald", "emma");

    // global variables
    private int numPlayers;
    private int numLives, maxLives;
    private int numInfoTokens, maxInfoTokens;
    private int numColors, numRanks;
    private int numTotalCards, numCardsDeck, numDiscardedCards;
    private int[][] discarded = new int[5][5];
    private int[] stack = new int[5];
    private int cardsPerPlayer;
    private int score, maxScore;

    private HanabiCardHolder[] cardHolders = new HanabiCardHolder[5];

    private int playerTurn;
    private boolean lastRound;
    private String lastPlayer;

    private int hintId;

    @Override
    public void init(String[] args) {
        // number of players
        numPlayers = Integer.parseInt(args[0]);
        if (numPlayers < 2 || numPlayers > 5) {
            throw new IllegalArgumentException("number of players must be between 2 and 5");
        }
        addPercept(Literal.parseLiteral(String.format("num_players(%d)", numPlayers)));
        for (int i = 0; i < numPlayers; i++) {
            addPercept(Literal.parseLiteral(String.format("player(%s)", agents.get(i))));
            addPercept(Literal.parseLiteral(String.format("turn_number(%s,%d)", agents.get(i), i+1)));
        }
        playerTurn = 0;

        // lives
        maxLives = Integer.parseInt(args[1]);
        numLives = maxLives;
        if (maxLives < 1) {
            throw new IllegalArgumentException("number of lives must be at least 1");
        }
        addPercept(Literal.parseLiteral(String.format("max_lives(%d)", maxLives)));
        addPercept(Literal.parseLiteral(String.format("num_lives(%d)", maxLives)));

        // information tokens
        maxInfoTokens = Integer.parseInt(args[2]);
        numInfoTokens = maxInfoTokens;
        if (maxInfoTokens < 1) {
            throw new IllegalArgumentException("number of information tokens must be at least 1");
        }
        addPercept(Literal.parseLiteral(String.format("max_info_tokens(%d)", maxInfoTokens)));
        addPercept(Literal.parseLiteral(String.format("num_info_tokens(%d)", maxInfoTokens)));

        // colors
        numColors = Integer.parseInt(args[3]);
        if (numColors < 1 || numColors > 5) {
            throw new IllegalArgumentException("number of card colors must be between 1 and 5");
        }
        addPercept(Literal.parseLiteral(String.format("num_colors(%d)", numColors)));

        // ranks
        numRanks = Integer.parseInt(args[4]);
        if (numRanks < 1 || numRanks > 5) {
            throw new IllegalArgumentException("number of card ranks must be between 1 and 5");
        }
        addPercept(Literal.parseLiteral(String.format("num_ranks(%d)", numRanks)));

        // total cards in deck
        numTotalCards = 0;
        for (int i = 0; i < numRanks; i++) {
            numTotalCards += numColors * cardsPerRank.get(i);
            addPercept(Literal.parseLiteral(String.format("cards_per_rank(%d,%d)", i+1, cardsPerRank.get(i))));
            addPercept(Literal.parseLiteral(String.format("rank(%d)", i + 1)));
        }
        numCardsDeck = numTotalCards;
        numDiscardedCards = 0;
        addPercept(Literal.parseLiteral(String.format("num_total_cards(%d)", numTotalCards)));
        addPercept(Literal.parseLiteral(String.format("num_cards_deck(%d)", numTotalCards)));
        addPercept(Literal.parseLiteral(String.format("num_discarded_cards(%d)", 0)));

        for (int i = 0; i < numColors; i++) {
            for (int j = 0; j < numRanks; j++) {
                // deck as an array: deck[color][rank(-1)] <-- number of cards
                deck[i][j] = cardsPerRank.get(j);
                // no cards of any color-rank discarded yet
                discarded[i][j] = 0;
                addPercept(Literal.parseLiteral(String.format("discarded(%s,%d,%d)", hanabiColors.get(i), j + 1, 0)));
            }
        }

        // set seed of the random card dealer
        int seed = Integer.parseInt(args[5]);
        addPercept(Literal.parseLiteral(String.format("seed(%d)", seed)));
        cardDealer.setSeed(seed);

        // the stacks of cards
        for (int i = 0; i < numColors; i++) {
            stack[i] = 0;
            addPercept(Literal.parseLiteral(String.format("stack(%s,%d)", hanabiColors.get(i), 0)));
            addPercept(Literal.parseLiteral(String.format("color(%s)", hanabiColors.get(i))));
        }

        // number of cards in the holders
        if (numPlayers == 2 || numPlayers == 3) {
            cardsPerPlayer = 5;
        } else {
            cardsPerPlayer = 4;
        }
        addPercept(Literal.parseLiteral(String.format("cards_per_player(%d)", cardsPerPlayer)));
        for (int i = 0; i < cardsPerPlayer; i++) {
            addPercept(Literal.parseLiteral(String.format("slot(%d)", i + 1)));
        }

        // score
        score = 0;
        maxScore = numRanks * numColors;
        addPercept(Literal.parseLiteral(String.format("score(%d)", 0)));
        addPercept(Literal.parseLiteral(String.format("max_score(%d)", maxScore)));

        // hint counter
        hintId = 1;
        addPercept(Literal.parseLiteral(String.format("hint_id(%d)", hintId)));

        // card holders
        for (int i = 0; i < numPlayers; i++) {
            cardHolders[i] = new HanabiCardHolder(agents.get(i), cardsPerPlayer);
        }
        // populate card holders initially from within the environment
        for (int i = 0; i < numPlayers; i++) {
            String agent = agents.get(i);
            for (int j = 1; j <= cardsPerPlayer; j++) {
                drawRandomCard(agent, j);
            }
        }

        lastRound = false;
        lastPlayer = null;
    }

    @Override
    public boolean executeAction(String agent, Structure action) {
        boolean result = false;

        // if wrong player is taking action, return false right away
        if (playerTurn > 0 && !agent.equals(agents.get(playerTurn - 1))) {
            return result;
        }

        // action: start the game by game_master agent
        if (action.getFunctor().equals("start_game")) {
            result = startGame();
        }

        // action: finish turn of current player
        else if (action.getFunctor().equals("finish_turn")) { // finish_turn
            result = moveToNextPlayer(agent);
        }

        // action: pick random card from deck and put it in the card holder
        else if (action.getFunctor().equals("draw_random_card")) { // draw_random_card(Slot)
            int slot = Integer.parseInt(action.getTerm(0).toString());
            result = drawRandomCard(agent, slot);
        }

        // action: pick a card from the card holder and play it
        else if (action.getFunctor().equals("play_card")) {
            int slot = Integer.parseInt(action.getTerm(0).toString());
            result = playCard(agent, slot);
        }

        // action: pick a card from the card holder and discard it
        else if (action.getFunctor().equals("discard_card")) {
            int slot = Integer.parseInt(action.getTerm(0).toString());
            result = discardCard(agent, slot);
        }

        // action: spend an information token
        else if (action.getFunctor().equals("spend_info_token")) {
            result = spendInfoToken();
        }

        return result;
    }

    private boolean startGame() {
        playerTurn = 1;
        String movingPlayer = agents.get(playerTurn - 1);
        addPercept(Literal.parseLiteral(String.format("player_turn(%s)", movingPlayer)));
        return true;
    }

    private boolean moveToNextPlayer(String agent) {
        if (lastRound && agent.equals(lastPlayer)) {
            stop();
        }

        removePerceptsByUnif(Literal.parseLiteral("player_turn(_)"));
        playerTurn = playerTurn % numPlayers + 1;
        String movingPlayer = agents.get(playerTurn - 1);
        addPercept(Literal.parseLiteral(String.format("player_turn(%s)", movingPlayer)));
        return true;
    }

    private boolean drawRandomCard(String agent, int slot) {
        if (numCardsDeck == 0) {
            return false;
        }

        // draw random card from deck
        String colorDrawn = "none";
        int rankDrawn = -1;
        int chosenCard = cardDealer.nextInt(numCardsDeck);
        int counter = 0, i = 0, j = 0;
        outer: for (i = 0; i < numColors; i++) {
            for (j = 0; j < numRanks; j++) {
                counter += deck[i][j];
                if (counter > chosenCard) {
                    deck[i][j] -= 1;
                    colorDrawn = hanabiColors.get(i);
                    rankDrawn = j + 1;
                    break outer;
                }
            }
        }

        // something went wrong when drawing the card
        if (colorDrawn == "none" || rankDrawn == -1) {
            return false;
        }

        // update numCardsDeck
        numCardsDeck -= 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("num_cards_deck(_)")));
        addPercept(Literal.parseLiteral(String.format("num_cards_deck(%d)", numCardsDeck)));

        // put the drawn card in the holder of the agent
        int index = agents.indexOf(agent);
        boolean cardCorrectlyPlaced = cardHolders[index].placeCard(slot, colorDrawn, rankDrawn);
        if (!cardCorrectlyPlaced) {
            return false;
        }

        // update percepts for the other agents
        for (int k = 0; k < numPlayers; k++) {
            if (k != index) {
                addPercept(agents.get(k), Literal.parseLiteral(String.format("has_card_color(%s,%d,%s)", agent, slot, colorDrawn)));
                addPercept(agents.get(k), Literal.parseLiteral(String.format("has_card_rank(%s,%d,%d)", agent, slot, rankDrawn)));
            }
        }
        addPercept("game_master", Literal.parseLiteral(String.format("has_card_color(%s,%d,%s)", agent, slot, colorDrawn)));
        addPercept("game_master", Literal.parseLiteral(String.format("has_card_rank(%s,%d,%d)", agent, slot, rankDrawn)));

        // when last card is drawn, mechanism to consider that only one move per player is left
        if (numCardsDeck == 0) {
            lastRound = true;
            addPercept(Literal.parseLiteral("late_game"));
            lastPlayer = agent;
            addPercept(Literal.parseLiteral(String.format("last_player(%s)", agent)));
        }

        return true;
    }

    private boolean playCard(String agent, int slot) {
        // pick the card from the holder
        int index = agents.indexOf(agent);
        HanabiCard card = cardHolders[index].pickCard(slot);
        if (card == null) {
            return false;
        }

        // update percepts for the other players
        for (int k = 0; k < numPlayers; k++) {
            if (k != index) {
                removePerceptsByUnif(agents.get(k), Literal.parseLiteral(String.format("has_card_color(%s,%d,_)", agent, slot)));
                removePerceptsByUnif(agents.get(k), Literal.parseLiteral(String.format("has_card_rank(%s,%d,_)", agent, slot)));
            }
        }
        removePerceptsByUnif("game_master", Literal.parseLiteral(String.format("has_card_color(%s,%d,_)", agent, slot)));
        removePerceptsByUnif("game_master", Literal.parseLiteral(String.format("has_card_rank(%s,%d,_)", agent, slot)));

        String color = card.getColor();
        int rank = card.getRank();
        int colorInd = hanabiColors.indexOf(color);
        int stackHeight = stack[colorInd];

        // card is successfully played
        if (rank == stackHeight + 1) {
            // place card in stack
            stack[colorInd] += 1;
            removePerceptsByUnif(Literal.parseLiteral(String.format("stack(%s,_)",color)));
            addPercept(Literal.parseLiteral(String.format("stack(%s,%d)",color,stack[colorInd])));
            // update score by 1 point
            score += 1;
            removePerceptsByUnif(Literal.parseLiteral(String.format("score(_)")));
            addPercept(Literal.parseLiteral(String.format("score(%d)",score)));
            // if current score == maxScore: finish execution of the game
            if (score == maxScore) {
                stop();
            }
            // complete stack has bonus: plus one information token
            if (rank == numRanks && numInfoTokens < maxInfoTokens) {
                numInfoTokens += 1;
                removePerceptsByUnif(Literal.parseLiteral(String.format("num_info_tokens(_)")));
                addPercept(Literal.parseLiteral(String.format("num_info_tokens(%d)",numInfoTokens)));
            }
        } else {
            // cards is not okay to play
            // loose one live
            numLives -= 1;
            removePerceptsByUnif(Literal.parseLiteral(String.format("num_lives(_)")));
            addPercept(Literal.parseLiteral(String.format("num_lives(%d)",numLives)));
            // if all lives lost: loose the game (score goes to 0) and finish execution
            if (numLives == 0) {
                score = 0;
                removePerceptsByUnif(Literal.parseLiteral(String.format("score(_)")));
                addPercept(Literal.parseLiteral(String.format("score(%d)",score)));
                stop();
            }
            // discard the badly played card
            numDiscardedCards += 1;
            removePerceptsByUnif(Literal.parseLiteral(String.format("num_discarded_cards(_)")));
            addPercept(Literal.parseLiteral(String.format("num_discarded_cards(%d)",numDiscardedCards)));
            discarded[colorInd][rank-1] += 1;
            removePerceptsByUnif(Literal.parseLiteral(String.format("discarded(%s,%d,_)", color, rank)));
            addPercept(Literal.parseLiteral(String.format("discarded(%s,%d,%d)", color, rank, discarded[colorInd][rank-1])));
        }

        return true;
    }

    private boolean discardCard(String agent, int slot) {
        if (numInfoTokens == maxInfoTokens) {
            return false;
        }

        // pick the card from the holder
        int index = agents.indexOf(agent);
        HanabiCard card = cardHolders[index].pickCard(slot);
        if (card == null) {
            return false;
        }

        // update percepts for the other players
        for (int k = 0; k < numPlayers; k++) {
            if (k != index) {
                removePerceptsByUnif(agents.get(k), Literal.parseLiteral(String.format("has_card_color(%s,%d,_)", agent, slot)));
                removePerceptsByUnif(agents.get(k), Literal.parseLiteral(String.format("has_card_rank(%s,%d,_)", agent, slot)));
            }
        }
        removePerceptsByUnif("game_master", Literal.parseLiteral(String.format("has_card_color(%s,%d,_)", agent, slot)));
        removePerceptsByUnif("game_master", Literal.parseLiteral(String.format("has_card_rank(%s,%d,_)", agent, slot)));

        String color = card.getColor();
        int rank = card.getRank();
        int colorInd = hanabiColors.indexOf(color);

        numDiscardedCards += 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("num_discarded_cards(_)")));
        addPercept(Literal.parseLiteral(String.format("num_discarded_cards(%d)",numDiscardedCards)));
        discarded[colorInd][rank-1] += 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("discarded(%s,%d,_)", color, rank)));
        addPercept(Literal.parseLiteral(String.format("discarded(%s,%d,%d)", color, rank, discarded[colorInd][rank-1])));

        // get one info token
        numInfoTokens += 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("num_info_tokens(_)")));
        addPercept(Literal.parseLiteral(String.format("num_info_tokens(%d)",numInfoTokens)));

        return true;
    }

    private boolean spendInfoToken() {
        if (numInfoTokens == 0) {
            return false;
        }

        numInfoTokens -= 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("num_info_tokens(_)")));
        addPercept(Literal.parseLiteral(String.format("num_info_tokens(%d)",numInfoTokens)));

        hintId += 1;
        removePerceptsByUnif(Literal.parseLiteral(String.format("hint_id(_)")));
        addPercept(Literal.parseLiteral(String.format("hint_id(%d)",hintId)));

        return true;
    }

    @Override
    public void stop() {
        System.out.println(String.format("Game finished with score %d.", score));
        // FIXME: actually exit from running the MAS. Does this work?
        try{
            // TODO: wait a bit so agents print
            getEnvironmentInfraTier().getRuntimeServices().stopMAS();
        }
        catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
    }

}
