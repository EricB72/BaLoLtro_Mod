SMODS.Joker {
    key = 'reapers_toll',
    atlas = 'legendary_league_items',
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
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
        if context.first_hand_drawn then
            G.GAME.chips = G.GAME.blind.chips * card.ability.extra.minPercent / 100
        end

        if context.after then
            local percent_score = G.GAME.chips * card.ability.extra.percent / 100

            G.GAME.chips = G.GAME.chips + percent_score
            card.ability.extra.minPercent = card.ability.extra.minPercent + 1

            if card.ability.extra.minPercent > card.ability.extra.maxPercent then card.ability.extra.minPercent = card.ability.extra.maxPercent end

            return {
                message = tostring(percent_score) .. '%',
                message_colour = G.C.White
            }
        end
    end
}