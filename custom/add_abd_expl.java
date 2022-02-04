package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class add_abd_expl extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            ListTermImpl list = (ListTermImpl)args[0];
            ag.addExplanation(list);
            return true;
        } catch (ClassCastException e) {
            throw new JasonException("Class casting error in 'add_abd_expl': " + e.toString());
        } catch (Exception e) {
            throw new JasonException("Error in 'add_abd_expl': " + e.toString());
        }
    }
}
    