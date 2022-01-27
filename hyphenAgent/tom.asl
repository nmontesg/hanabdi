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
    for ( .member(Next, L) ) {
        .findall(B [Annot], knows(Next, B [Annot]), BList);
        .relevant_rules(_, AllRules);
        custom.remove_beliefs;
        for ( .member(Bel [Annot], BList) ) {
            +Bel [Annot];
        }
        for ( .member(Rule, AllRules) ) {
            +Rule [source(self)];
        }
    }.

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
