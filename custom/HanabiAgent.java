package custom;

import jason.asSemantics.*;
import jason.asSyntax.*;
import jason.bb.DefaultBeliefBase;
import jason.JasonException;
import java.util.*;

public class HanabiAgent extends Agent {

    private DefaultBeliefBase backUp = new DefaultBeliefBase();

    public void backUpBeliefs() throws Exception {
        boolean isBackUpEmpty = (backUp.size() == 0);
        if (!isBackUpEmpty) {
            throw new JasonException("Back-up BB is not empty");
        }
        for (Literal l : bb) {
            backUp.add(l);
        }
    }

    public void recoverBeliefs() throws Exception {
        if (backUp.size() == 0) {
            throw new JasonException("No beliefs in the back-up BB to be copied back to the main BB");
        }
        if (bb.size() != 0) {
            throw new JasonException("The main BB is not empty");
        }
        for (Literal l : backUp) {
            bb.add(l);
        }
        backUp.clear();
    }

    public void removeBeliefs() {
        bb.clear();
    }
       
}