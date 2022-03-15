package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class list2conjunction extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            ListTermImpl conjuncts = (ListTermImpl)args[0];
            NumberTermImpl negate = (NumberTermImpl)args[1];
            boolean reverse = false;
            if (negate.solve() == 1) {
                reverse = true;
            }
            
            Literal firstConjunct = (Literal)conjuncts.get(0);
            boolean isNegated = firstConjunct.negated();
            if (reverse) {
                firstConjunct = firstConjunct.setNegated(isNegated);
            }

            StringBuilder conjunctionStr = new StringBuilder(firstConjunct.toString());
            
            for (int i = 1; i < conjuncts.size(); i++) {
                Literal conjunct = (Literal)conjuncts.get(i);
                isNegated = conjunct.negated();
                if (reverse) {
                    conjunct = conjunct.setNegated(isNegated);
                }
                conjunctionStr.append(" & ");
                conjunctionStr.append(conjunct.toString());
            }

            LogicalFormula conjunction = LogExpr.parseExpr(conjunctionStr.toString());

            return un.unifies(conjunction, args[2]);
        } catch (Exception e) {
            throw new JasonException("Error in 'list2conjunction': " + e.toString());
        }
    }
    
}