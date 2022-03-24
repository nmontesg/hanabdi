package hanabiAgent;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class remove_rule extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            Rule r = (Rule)args[0];
            return ag.deleteRule(r);
        } catch (Exception e) {
            throw new JasonException("Error in 'remove_rule': " + e.toString());
        }
    }
    
}