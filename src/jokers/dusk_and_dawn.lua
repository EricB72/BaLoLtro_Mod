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
            triggered = false,
            other_joker = 0
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.triggered,
                card.ability.extra.other_joker
            }
        }
    end,
    calculate = function(self, card, context)
        if card.area and card.area == G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.extra.spellblade then card.ability.extra.other_joker = G.jokers.cards[i] end
            end
        end

        if context.joker_main and card.ability.extra.prevHand ~= card.ability.extra.highCard and card.ability.extra.highCard == context.scoring_name then
            return {
                chips = (card.ability.extra.other_joker).ability.extra.chips,
                mult = (card.ability.extra.other_joker).ability.extra.mult,
                xchips = (card.ability.extra.other_joker).ability.extra.chipsMult,
                xmult = (card.ability.extra.other_joker).ability.extra.multMult,
                dollars = (card.ability.extra.other_joker).ability.extra.dollars
            }
        end
    end
}