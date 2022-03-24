package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class expr_operator extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            LogExpr expr = (LogExpr)args[0];
            StringTermImpl operator;

            switch (expr.getOp()) {
                case and:
                    operator = new StringTermImpl("and");
                    break;
                
                case or:
                    operator = new StringTermImpl("or");
                    break;

                case not:
                    operator = new StringTermImpl("not");
                    break;
             
                default:
                    operator = new StringTermImpl("none");
            }
            
            return un.unifies(operator, args[1]);

        } catch (ClassCastException e) {
            return false;
        } catch (Exception e) {
            throw new JasonException("Error in 'expr_operator': " + e.toString());
        }
    }   
}
