inference(
    playable(Player,Slot),
    [
        has_card_color(Player,Slot,Color),
        has_card_rank(Player,Slot,Rank),
        stack(Color,Rank-1)
    ]
).

inference(
    critical(Player,Slot),
    [
        has_card_color(Player,Slot,Color),
        has_card_rank(Player,Slot,Rank),
        cards_per_rank(Rank,N),
        discarded(Color,Rank,N-1)
    ]
).




// We are all using the same inference rules
believes(Ag,inference(C,P)) :- inference(C,P).

// An agent will infer a conclusions if it believes in the premises and in the
// inference rule
believes(Ag,C) :- believes(Ag,inference(C,P)) & believes(P).


// First-order Theory of Mind: what do other agents perceive
believes(Ag,P[source(percept)]) :-
    P[source(percept)] &
    P \== has_card_rank(_,_) &
    P \== has_card_rank(_,_).

believes(Ag,)
