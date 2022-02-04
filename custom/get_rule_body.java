package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class get_rule_body extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            Rule rule = (Rule)args[0];
            Literal body = (Literal)rule.getBody();
            return un.unifies(body, args[1]);
        } catch (ClassCastException e) {
            throw new JasonException("Casting error in 'get_rule_body'");
        } catch (Exception e) {
            throw new JasonException("Error in 'get_rule_body': " + e.toString());
        }
    }
    
}