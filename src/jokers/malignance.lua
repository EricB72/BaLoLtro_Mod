SMODS.Joker {
    key = 'malignance',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 11
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xchips = 1.1,
            bonus = 'm_bonus'
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.bonus
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if next(SMODS.get_enhancements(context.other_card)) and next(SMODS.get_enhancements(context.other_card)) == card.ability.extra.bonus then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
    end
}