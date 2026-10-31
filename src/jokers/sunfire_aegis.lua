SMODS.Joker {
    key = 'sunfire_aegis',
    atlas = 'league_items_good',
    pos = {
        x = 39,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            percentage = 10
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.debuffed_hand or (context.joker_main and G.GAME.blind.triggered) or (context.individual and context.other_card.debuff and context.cardarea == G.play) then
            return {
                score = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100
            }
        end
    end
}