package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class list2dnf extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            StringBuilder dnfStr = new StringBuilder();
            ListTermImpl listOfExplanations = (ListTermImpl) args[0];
            for (Term expl : listOfExplanations) {
                ListTermImpl explanation = (ListTermImpl) expl;
                StringBuilder conjunction = new StringBuilder();
                if (explanation.size() == 0) {
                    conjunction.append("true");
                } else {
                    for (Term ground : explanation) {
                        if (!ground.isGround()) {
                            throw new JasonException("Error in 'list2dnf': " + ground.toString() + " is not a ground term");
                        }
                        conjunction.append(ground.toString() + " & ");
                    }
                    for (int i = 0; i < 3; i++) {conjunction.deleteCharAt(conjunction.length()-1);}
                }
                dnfStr.append("(" + conjunction.toString() + ") | ");
            }
            for (int i = 0; i < 3; i++) {dnfStr.deleteCharAt(dnfStr.length()-1);}
            LogicalFormula dnf = LogExpr.parseExpr(dnfStr.toString());
            return un.unifies(dnf, args[1]);
        } catch (Exception e) {
            throw new JasonException("Error in 'list2dnf': " + e.toString());
        }
    }
}
