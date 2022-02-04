package custom;

import jason.asSemantics.*;
import jason.asSyntax.*;
import jason.bb.DefaultBeliefBase;
import jason.JasonException;
import java.util.*;

public class HanabiAgent extends Agent {

    private DefaultBeliefBase backUp = new DefaultBeliefBase();
    private DefaultBeliefBase abducedExpls = new DefaultBeliefBase();

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

    public void addExplanation(ListTermImpl list) {
        // the empty explanation
        if (list.size() == 0) {
            Literal conjunction = Literal.parseLiteral("true");
            abducedExpls.add(conjunction);
            return;
        }

        LogicalFormula first = (LogicalFormula)list.get(0);
        Iterator<Term> it = list.iterator();
        // LogExpr conjunction
        while (it.hasNext()) {

        }


    }
       
}