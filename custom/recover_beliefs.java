package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class recover_beliefs extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            ag.recoverBeliefs();
            return true;
        } catch (Exception e) {
            throw new JasonException("Error in 'recover_beliefs': " + e.toString());
        }
    }
    
}
