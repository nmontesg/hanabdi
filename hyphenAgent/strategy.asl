// generic plan to select and action and perform it when the agent perceives
// that it is their turn

+player_turn(N) : my_name(Me) & turn_number(Me, N) & N = 1
    <- .relevant_rules(has_playable_card(bob, S), [Rule|_]);
    //.print(Rule);
    /*
    custom.unify_rule_body(has_playable_card(bob, S), Rule, InstantiatedRule);
    .print(Rule);
    .print(InstantiatedRule);
    */
    ?select_action(Action);
    .print("I selected the action: ", Action);
    !Action;
    .

// The pre-defined selection function to choose a plan among those that are
// applicable chooses according to the order in which plans appear in the
// plan library. This is good to program the strategic selection of an action
// to take

@hintCriticalCard[priority(1)]
+?select_action(give_hint(ToPlayer, rank, Rank)) :
    available_info_tokens &
    turns_ahead(ToPlayer, 1) &
    has_critical_card(ToPlayer, Slot) &
    chop(ToPlayer, Slot) &
    has_card_rank(ToPlayer, Slot, Rank).

@playPlayableCard[priority(2)]
+?select_action(play_card(Slot)) :
    my_name(Me) & has_playable_card(Me, Slot).

@hintPlayableCard[priority(3)]
+?select_action(give_hint(HintedPlayer, rank, Rank)) :
    available_info_tokens &
    closest_player_with_oldest_playable_unhinted_card(HintedPlayer, FocusSlot) &
    has_card_rank(HintedPlayer, FocusSlot, Rank).

@discardMyChopCard[priority(4)]
+?select_action(discard_card(Chop)) :
    spent_info_tokens & my_name(Me) & chop(Me, Chop).

@defaultAction[priority(5)]
+?select_action(play_card(Slot)) :
    my_name(Me) & ordered_slots(Me, [Slot|_]).
