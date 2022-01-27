package custom;

import jason.asSemantics.*;
import jason.asSyntax.*;
import jason.bb.DefaultBeliefBase;
import jason.JasonException;
import java.util.*;

public class HanabiAgent extends Agent {

    private DefaultBeliefBase backUp = new DefaultBeliefBase();
    private boolean abductionMode = false;
    private Stack<Option> abductionStack = new Stack<Option>();

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

    public void switchAbductionMode() {
        if (abductionMode) {
            // if abduction mode is on and being turned off, empty the abduction stack
            abductionMode = false;
        } else {
            // if abduction mode if being turned on, reset the abduction stack
            abductionMode = true;
            abductionStack = new Stack<Option>();
        }
    }

    @Override
    public Option selectOption(List<Option> options) {
        // TODO: delete this
        // System.out.println(String.format("there are %d options", options.size()));
        // not in abduction mode: select the default option
        if (!abductionMode) {
            return super.selectOption(options);
        } else {
            // if we are in abduction mode, push all the options to the top of the
            // abduction stack and pop the top of the stack
            // System.out.println(options.toString());
            try {
                Iterator<Option> it = options.iterator();
                while (it.hasNext()) {
                    Option opt = it.next();
                    abductionStack.push(opt);
                }
                return abductionStack.pop();
            } catch (EmptyStackException e) {
                return null;
            }
        }
    }
    
}