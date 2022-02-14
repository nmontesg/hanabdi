package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;
import jason.bb.*;

public class add_rule extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            BeliefBase bb = ag.getBB();
            Rule rule = (Rule)args[0];
            bb.add(rule);
            return true;
        } catch (ClassCastException e) {
            throw new JasonException("Agent executing 'add_rule' cannot be casted to HanabiAgent class");
        } catch (Exception e) {
            throw new JasonException("Error in 'add_rule': " + e.toString());
        }
    }
    
}