SMODS.Joker {
    key = 'spear_of_shojin',
    atlas = 'league_items_good',
    pos = {
        x = 29,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            xmult = 0.5,
            luck = 1,
            currentMult = 0,
            currentLuck = 0
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.luck,
                card.ability.extra.currentMult,
                card.ability.extra.currentLuck
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.currentMult = 1 + card.ability.extra.xmult * (#G.consumeables.cards or 0)
        card.ability.extra.currentLuck = 1 + card.ability.extra.luck * (#G.consumeables.cards or 0)

         if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * card.ability.extra.currentLuck
            }
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.currentMult
            }
        end
    end
}