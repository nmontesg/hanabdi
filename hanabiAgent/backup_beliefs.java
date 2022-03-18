package hanabiAgent;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class backup_beliefs extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            ag.backUpBeliefs();
            return true;
        } catch (Exception e) {
            throw new JasonException("Error in 'backup_beliefs': " + e.toString());
        }
    }
    
}