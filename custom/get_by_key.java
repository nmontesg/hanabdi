package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class get_by_key extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            MapTermImpl map = (MapTermImpl)args[0];
            Term key = args[1];
            Term value = map.get(key);
            return un.unifies(value, args[2]);
        } catch (Exception e) {
            throw new JasonException("Error in 'get_by_key': " + e.toString());
        }
    }

}