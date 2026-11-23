SMODS.Joker {
    key = 'sf',
    atlas = 'league_items_good',
    pos = {
        x = 27,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            ecrit_chance = 0,
            maxPercentage = 40,
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.ecrit_chance,
                card.ability.extra.maxPercentage
            }
        }
    end,
    calculate = function(self, card, context)
        if (G.GAME.chips or 0) / (G.GAME.blind.chips or 1) * 100 >= 100 - card.ability.extra.maxPercentage then
            card.ability.extra.ecrit_chance = 100
        else
            card.ability.extra.ecrit_chance = 0
        end
    end
}