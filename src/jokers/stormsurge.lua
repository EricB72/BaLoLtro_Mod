SMODS.Joker {
    key = 'stormsurge',
    atlas = 'common_league_items',
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 25,
            chips = 50
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
                chips = card.ability.extra.chips * (G.GAME.chips / G.GAME.blind.chips) / card.ability.extra.percentage
            }
        end


    end
}