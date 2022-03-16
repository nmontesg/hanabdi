package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

// TODO: test this IA from conjunction to list

public class list2conjunction extends DefaultInternalAction {

    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        try {
            // first get if the literats should be negated
            NumberTermImpl negate = (NumberTermImpl)args[1];
            boolean reverse = false;
            if (negate.solve() == 1) {
                reverse = true;
            }
            boolean isNegated;

            if (!args[0].isVar() && args[2].isVar()) {
                // list --> conjunction
                ListTermImpl conjuncts = (ListTermImpl)args[0];
                
                Literal firstConjunct = (Literal)conjuncts.get(0);
                isNegated = firstConjunct.negated();
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

            } else if (args[0].isVar() && !args[2].isVar()) {
                // conjunction --> list
                ListTermImpl list = new ListTermImpl();
                LogExpr conjunction = (LogExpr)args[2];

                while (conjunction.getOp().equals(LogExpr.LogicalOp.and)) {
                    Literal lhs = (Literal)conjunction.getLHS();
                    isNegated = lhs.negated();
                    if (reverse) {
                        lhs = lhs.setNegated(isNegated);
                    }
                    list.add(lhs);
                    conjunction = (LogExpr)conjunction.getRHS();
                }

                Literal last = (Literal)conjunction;
                isNegated = conjunction.negated();
                if (reverse) {
                    last = last.setNegated(isNegated);
                }
                list.add(last);

                return un.unifies(list, args[0]);

            } else {
                return false;
            }
        } catch (Exception e) {
            throw new JasonException("Error in 'list2conjunction': " + e.toString());
        }
    }
    
}