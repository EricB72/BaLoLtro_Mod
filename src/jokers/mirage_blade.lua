SMODS.Joker {
    key = 'mirage_blade',
    atlas = 'legendary_league_items',
    pos = {
        x = 2,
        y = 15
    },
    soul_pos = {
        x = 3,
        y = 15
    },
    display_size = {
        w = 79,
        h = 78
    },
    config = {
        extra = {
            percent = 1,
            minPercent = 0,
            maxPercent = 50
        }
    },
    rarity = 4,
    cost = 11,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.minPercent,
                card.ability.extra.maxPercent
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'NOPE!'
            }
        end
    end
}