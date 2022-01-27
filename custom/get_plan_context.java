package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class get_plan_context extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            Plan plan = (Plan)args[0];
            LogExpr context = (LogExpr)plan.getContext();
            return un.unifies(context, args[1]);
        } catch (ClassCastException e) {
            throw new JasonException("Casting error in 'get_plan_context'");
        } catch (Exception e) {
            throw new JasonException("Error in 'get_plan_context': " + e.toString());
        }
    }
    
}