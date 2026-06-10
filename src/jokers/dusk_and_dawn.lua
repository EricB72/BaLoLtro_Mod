SMODS.Joker {
    key = 'dad',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            highCard = 'High Card',
            prevHand = 'None',
            triggered = false
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.triggered
}
        }
    end,
    calculate = function(self, card, context)
        if context.before and card.ability.extra.prevHand == card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard and card.ability.extra.triggered then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.extra.spellblade then
                    G.jokers.cards[i].ability.extra.prevHand = 'None'
                    card.ability.extra.prevHand = card.ability.extra.highCard
                    card.ability.extra.triggered = false
                end
            end
        end
        
        if context.joker_main then
            local text = context.scoring_name

            if card.ability.extra.prevHand ~= card.ability.extra.highCard and text == card.ability.extra.highCard then
                card.ability.extra.triggered = true
            end

            card.ability.extra.prevHand = context.scoring_name
        end

        if context.hand_drawn or context.end_of_round and card.ability.extra.triggered then
            return {
                message = localize('k_active')
            }
        end
    end
}