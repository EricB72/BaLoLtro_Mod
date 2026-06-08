SMODS.Joker {
    key = 'joker1',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = {
            chips = 100,
            mult = 20
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}