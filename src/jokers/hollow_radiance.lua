SMODS.Joker {
    key = 'hr',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 50,
            percentage = 5,
            maxPercentage = 50,
            second = true,
            first = true
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.percentage,
                card.ability.extra.maxPercentage,
                card.ability.extra.second,
                card.ability.extra.first
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if not card.ability.extra.first and card.ability.extra.second and tonumber(tostring(G.GAME.chips / G.GAME.blind.chips)) >= (card.ability.extra.maxPercentage / 100) then
                card.ability.extra.second = false
                return {
                    chips = card.ability.extra.chips + G.GAME.blind.chips * card.ability.extra.percentage / 100
                }
            else
                if not card.ability.extra.first then card.ability.extra.second = false end
                card.ability.extra.first = false
                return {
                    chips = card.ability.extra.chips
                }
            end
        end

        if context.end_of_round then
            card.ability.extra.second = true
            card.ability.extra.first = true
        end
    end
}