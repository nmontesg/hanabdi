package custom;

import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class list2formula extends DefaultInternalAction {

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

            // second get the operator they should use (and or not)
            StringTermImpl operator = (StringTermImpl)args[2];
            String divider;
            switch (operator.getString()) {
                case "and":
                    divider = " & ";
                    break;
                case "or":
                    divider = " | "; 
                    break;
                default:
                    throw new JasonException("Error in 'list2formula: operator is not one of 'and' nor 'or'");
            }

            // list --> conjunction/disjunction
            ListTermImpl arguments = (ListTermImpl)args[0];
            Literal firstArgument = (Literal)arguments.get(0);
            isNegated = firstArgument.negated();
            if (reverse) {
                firstArgument = firstArgument.setNegated(isNegated);
            }

            StringBuilder formulaStr = new StringBuilder(firstArgument.toString());
            
            for (int i = 1; i < arguments.size(); i++) {
                Literal argum = (Literal)arguments.get(i);
                isNegated = argum.negated();
                if (reverse) {
                    argum = argum.setNegated(isNegated);
                }
                formulaStr.append(divider);
                formulaStr.append(argum.toString());
            }

            LogicalFormula formula = LogExpr.parseExpr(formulaStr.toString());

            return un.unifies(formula, args[3]);

        } catch (Exception e) {
            throw new JasonException("Error in 'list2formula': " + e.toString());
        }
    }
    
}