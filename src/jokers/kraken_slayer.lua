SMODS.Joker {
    key = 'kraken_slayer',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 5,
            mult = 1,
            scaling = 5,
            rank = 14
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.scaling,
                card.ability.extra.rank
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.id == card.ability.extra.rank then
                return {
                    chips = card.ability.extra.chips + card.ability.extra.chips * (G.GAME.chips / G.GAME.blind.chips) * card.ability.extra.scaling,
                    mult = card.ability.extra.mult + card.ability.extra.mult * (G.GAME.chips / G.GAME.blind.chips) * card.ability.extra.scaling
                }
            end
        end
    end
}