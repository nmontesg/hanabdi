package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

import java.util.TreeMap;
import java.util.Collection;

public class sort_by_priority extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            ListTermImpl listOfPlans = (ListTermImpl)args[0];
            TreeMap priorityToPlan = new TreeMap<Integer,Plan>();

            for (Term t : listOfPlans) {
                Plan plan = (Plan)t;
                NumberTermImpl prioTerm = (NumberTermImpl)plan.getLabel().getAnnot("priority").getTerm(0);
                double prioDouble = prioTerm.solve();
                int prioInt = (int)prioDouble;
                while (priorityToPlan.containsKey(prioInt)) {
                    prioInt += 1;
                }
                priorityToPlan.put(prioInt, plan);
            }

            Collection<Plan> sortedPlans = priorityToPlan.values();
            ListTermImpl sortedPlansList = new ListTermImpl();

            for (Plan p : sortedPlans) {
                sortedPlansList.add(p);
            }            
            return un.unifies(sortedPlansList, args[1]);

        } catch (Exception e) {
            throw new JasonException("Error in 'sort_by_priority': " + e.toString());
        }
    }
    
}
