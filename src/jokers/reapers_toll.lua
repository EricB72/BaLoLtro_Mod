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
        w = 80,
        h = 80
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
            return
            {
                score = G.GAME.blind.chips * card.ability.extra.minPercent / 100
            }
        end

        if context.joker_main and not context.blueprint then
            local percent_score = G.GAME.blind.chips * card.ability.extra.percent / 100

            card.ability.extra.minPercent = card.ability.extra.minPercent + 1

            if card.ability.extra.minPercent > card.ability.extra.maxPercent then card.ability.extra.minPercent = card.ability.extra.maxPercent end

            return {
                score = percent_score
            }
        end
    end
}