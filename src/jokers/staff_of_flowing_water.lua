SMODS.Joker {
    key = 'staff_of_flowing_water',
    atlas = 'league_items_good',
    pos = {
        x = 32,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            chips = 10,
            luck = 0.3,
            HandNum = 0
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.luck,
                card.ability.extra.HandNum
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * G.GAME.current_round.hands_left,
            }
        end

        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * (1 + (card.ability.extra.luck * G.GAME.current_round.hands_played))
            }
        end
    end
}