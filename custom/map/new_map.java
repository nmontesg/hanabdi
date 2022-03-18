package custom.map;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class new_map extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            MapTermImpl emptyMap = new MapTermImpl();
            return un.unifies(emptyMap, args[0]);
        } catch (Exception e) {
            throw new JasonException("Error in 'new_map': " + e.toString());
        }
    }

}
