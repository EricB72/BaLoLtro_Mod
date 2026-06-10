SMODS.Joker {
    key = 'tf',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            dollars = 1,
            chipsMult = 2,
            multMult = 2,
            highCard = 'High Card',
            prevHand = 'None',
            spellblade = true
        }
    },
    rarity = 3,
    cost = 9.99,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.chipsMult,
                card.ability.extra.multMult,
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.spellblade
            }
        }
    end,
    calculate = function(self, card, context)
        --Spellblade
        if context.joker_main then
            local text = context.scoring_name

            if card.ability.extra.prevHand ~= card.ability.extra.highCard and text == card.ability.extra.highCard then
                card.ability.extra.prevHand = context.scoring_name
                
                return {
                    xchips = card.ability.extra.chipsMult,
                    xmult = card.ability.extra.multMult,
                    dollars = card.ability.extra.dollars
                }
            else             
                card.ability.extra.prevHand = context.scoring_name
            end
        end
    end
}