package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class conjunction extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            LogExpr expr = (LogExpr)args[0];
            if (expr.getOp().equals(LogExpr.LogicalOp.and)) {
                return true;
            } else {
                return false;
            }
        } catch (ClassCastException e) {
            return false;
        }
    }
    
}
