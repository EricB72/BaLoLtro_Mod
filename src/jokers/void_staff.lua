SMODS.Joker {
    key = 'void_staff',
    atlas = 'league_items_good',
    pos = {
        x = 48,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            xchips = 1,
            maxPercentage = 0.05,
            currentScore = 0
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.maxPercentage,
                card.ability.extra.currentScore
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.currentScore = (G.GAME.chips / G.GAME.blind.chips) * 100

            return {
                xchips = card.ability.extra.xchips + (card.ability.extra.currentScore * card.ability.extra.maxPercentage)
            }
        end
    end
}