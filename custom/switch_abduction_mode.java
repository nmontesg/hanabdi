package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class switch_abduction_mode extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            HanabiAgent ag = (HanabiAgent)ts.getAg();
            ag.switchAbductionMode();
            return true;
        } catch (ClassCastException e) {
            throw new JasonException("Agent executing 'swicth_abduction_mode' cannot be casted to HanabiAgent class");
        } catch (Exception e) {
            throw new JasonException("Error in 'swicth_abduction_mode': " + e.toString());
        }

    }

}