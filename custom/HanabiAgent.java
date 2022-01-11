package custom;

import jason.JasonException;
import jason.asSemantics.Agent;
import jason.asSyntax.Literal;
import jason.bb.DefaultBeliefBase;
import java.util.Iterator;

public class HanabiAgent extends Agent {

    private DefaultBeliefBase backUp = new DefaultBeliefBase();

    public void backUpBeliefs() throws Exception {
        boolean isBackUpEmpty = (backUp.size() == 0);
        if (!isBackUpEmpty) {
            throw new JasonException("Back-up BB is not empty");
        }
        Iterator<Literal> it = bb.iterator();
        while (it.hasNext()) {
            Literal belief = it.next();
            backUp.add(belief);
        }
    }

    public void recoverBeliefs() throws Exception {
        if (backUp.size() == 0) {
            throw new JasonException("No beliefs in the back-up BB to be copied back to the main BB");
        }
        if (bb.size() != 0) {
            throw new JasonException("The main BB is not empty");
        }
        Iterator<Literal> itBU = backUp.iterator();
        while (itBU.hasNext()) {
            Literal belief = itBU.next();
            bb.add(belief);
            backUp.remove(belief);
        }
    }

    public void removeBeliefs() {
        Iterator<Literal> it = bb.iterator();
        while (it.hasNext()) {
            Literal belief = it.next();
            bb.remove(belief);
        }
    }

}