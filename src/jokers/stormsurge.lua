SMODS.Joker {
    key = 'stormsurge',
    atlas = 'league_items_good',
    pos = {
        x = 36,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            percentage = 25,
            chips = 100
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.chips / G.GAME.blind.chips * 100 >= card.ability.extra.percentage then
            return {
                chips = card.ability.extra.chips * (G.GAME.chips / G.GAME.blind.chips)
            }
        end
    end
}