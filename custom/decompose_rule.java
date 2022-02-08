package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class decompose_rule extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            Rule rule = (Rule)args[0];
            Literal head = (Literal)rule.getHead();
            Literal body = (Literal)rule.getBody();
            return (un.unifies(head, args[1]) && un.unifies(body, args[2]));
        } catch (Exception e) {
            throw new JasonException("Error in 'decompose_rule': " + e.toString());
        }
    }
    
}
