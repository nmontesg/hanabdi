package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class expr_operator extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            LogExpr expr = (LogExpr)args[0];
            Atom operator;

            switch (expr.getOp()) {
                case and:
                    operator = new Atom("and");
                    break;
                
                case or:
                    operator = new Atom("or");
                    break;

                case not:
                    operator = new Atom("not");
                    break;
             
                default:
                    operator = new Atom("none");
            }
            
            return un.unifies(operator, args[1]);

        } catch (ClassCastException e) {
            return false;
        } catch (Exception e) {
            throw new JasonException("Error in 'disjuncexpr_operatortion': " + e.toString());
        }
    }   
}
