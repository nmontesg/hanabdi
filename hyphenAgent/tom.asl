// The adopt_perspective(+L) plan saves the beliefs of the agent in a buffer
// and substitutes them by the beliefs that the agent would have if they took
// the perspective of the agents in L in sequences:
// Examples:
//      * I want to know what is the perspective of bob (nesting level 1):
//              !adopt_perspective([bob]).
//      * I want to know what bob thinks the perspective of cathy is (nesting level 2):
//              !adopt_perspective([bob, cathy]).
//      * I want to know what bob thinks my perspective is (nesting level 2):
//              my_name(Me); !adopt_perspective([bob, Me]).

@adoptPerspective[atomic]
+!adopt_perspective(L) : true
    <- custom.backup_beliefs;
    // for all the members whose perspective has to be adopted before the last
    // all the inference rules have to be copied
    .length(L, Len);
    for ( .range(I, 0, Len-2) ) {
        .nth(I, L, Next);
        .findall(Phi [Annot], knows(Next, Phi [Annot]), PhiList);
        .relevant_rules(_, AllRules);
        custom.remove_beliefs;
        for ( .member(Phi [Annot], PhiList) ) { +Phi [Annot]; }
        for ( .member(Rule, AllRules) ) { +Rule; }
    }
    // before the perspective of the last player is adopted, the abducible
    // atoms have to be retrieved (and later introduced into the BB). Also,
    // the inference rules to derive abducible atoms should NOT be copied,
    // as they may interfere with the abductive reasoning process.
    .nth(Len-1, L, Last);
    .findall(A, abducible(A), AbdList);
    .findall(Phi [Annot], knows(Last, Phi [Annot]), PhiList);
    .relevant_rules(_, AllRules);
    custom.remove_beliefs;
    for ( .member(Phi [Annot], PhiList) ) { +Phi [Annot]; }
    for ( .member(Rule, AllRules) ) {
        // abducible/1 rules should NOT be adopted. They interfere
        // with the abductive reasoning process
        custom.decompose_rule(Rule, Head, _);
        Head =.. [Functor, _, _];
        if ( Functor \== abducible ) { +Rule [source(self)]; }
    }
    for ( .member(A, AbdList) ) { +abducible(A); }.


/* -------- First-order Theory of Mind -------- */

knows(Ag, my_name(Ag) [source(self)]).

// Percepts: Except Ag's own cards, all other percepts are shared.
// has_card_color and has_card_rank are only available to Ag as percepts if
// they don't refer to Ag's own cards.

knows(Ag, P [source(percept)]) :-
    player(Ag) & 
    P [source(percept)] &
    P =.. [Functor, _, _] &
    Functor \== has_card_color &
    Functor \== has_card_rank.

knows(Agi, has_card_color(Agj, S, C) [source(percept)]) :-
    player(Agi) & player(Agj) & Agi \== Agj & slot(S) & color(C) &
    has_card_color(Agj, S, C) [source(percept)].

knows(Agi, has_card_rank(Agj, S, R) [source(percept)]) :-
    player(Agi) & player(Agj) & Agi \== Agj & slot(S) & rank(R) &
    has_card_rank(Agj, S, R) [source(percept)].

// Hints: information explicitly derived from hints is available to all other
// agents

knows(Ag, P [source(hint)]) :- player(Ag) & P [source(hint)].

// Mental notes: as all agents share the same code, they all make the same
// mental notes, which refer to the hints given and the ordered slots of
// the players

knows(Ag, hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots) [source(self)]) :-
    player(Ag) & hint(Id, FromPlayer, ToPlayer, Mode, Value, Slots) [source(self)].

knows(Agi, ordered_slots(Agj, Slots) [source(self)]) :-
    player(Agi) & player(Agj) & ordered_slots(Agj, Slots) [source(self)].
