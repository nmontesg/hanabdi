package customBB;

import jason.asSemantics.Agent;
import jason.asSyntax.Literal;
import jason.bb.DefaultBeliefBase;

// like the default belief base but parse the arguments as initial beliefs
public class InitialBeliefBase extends DefaultBeliefBase {

    @Override
    public void init(Agent ag, String[] args) {
        super.init(ag, args);
        for (int i= 0; i < args.length; i++) {
            add(Literal.parseLiteral(args[i]));
        }
    }

}
