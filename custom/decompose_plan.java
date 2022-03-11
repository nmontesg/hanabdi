package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class decompose_plan extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            Plan plan = (Plan)args[0];
            Pred label = plan.getLabel();
            Trigger trigger = plan.getTrigger();
            LogicalFormula context = plan.getContext();
            PlanBody body = plan.getBody();
            return (un.unifies(label, args[1]) &&
                    un.unifies(trigger, args[2]) &&
                    un.unifies(context, args[3]) &&
                    un.unifies(body, args[4]));
        } catch (Exception e) {
            throw new JasonException("Error in 'decompose_plan': " + e.toString());
        }
    }
    
}
