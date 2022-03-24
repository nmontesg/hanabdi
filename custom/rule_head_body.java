package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class rule_head_body extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            if (!args[0].isVar()) {
                // given a rule, return its head and its body
                Rule rule = (Rule)args[0];
                Literal head = rule.getHead();
                LogicalFormula body = rule.getBody();
                return (un.unifies(head, args[1]) && un.unifies(body, args[2]));
            } else {
                // given the head and the body, build the rule
                Literal head = (Literal)args[1];
                LogicalFormula body = (LogicalFormula)args[2];               
                Rule rule = new Rule(head, body);
                return un.unifies(rule, args[0]);
            }
        } catch (Exception e) {
            throw new JasonException("Error in 'rule_head_body': " + e.toString());
        }
    }
    
}
