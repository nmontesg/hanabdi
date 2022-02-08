package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class get_plan_title extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            Plan p = (Plan)args[0];
            Pred label = p.getLabel();
            String titleStr = label.getFunctor().replaceAll("[0-9]","");
            Literal title = Literal.parseLiteral(titleStr);
            return un.unifies(title, args[1]);
        } catch (Exception e) {
            throw new JasonException("Error in 'get_plan_title': " + e.toString());
        }
    }
    
}
