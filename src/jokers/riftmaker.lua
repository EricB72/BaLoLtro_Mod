SMODS.Joker {
    key = 'riftmaker',
    atlas = 'rare_league_items',
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            perHand = 20,
            maxHand = 4,
            hands = 1,
            dollarPercentage = 150,
            currInc = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local chips = (G.GAME.dollars or G.GAME.dollar_buffer or 0) * card.ability.extra.dollarPercentage / 100
        return {
            vars = {
                chips,
                card.ability.extra.perHand,
                card.ability.extra.maxHand,
                card.ability.extra.hands,
                card.ability.extra.dollarPercentage, 
                card.ability.extra.currInc
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.currInc = G.GAME.current_round.hands_played * card.ability.extra.perHand

            if G.GAME.current_round.hands_played > card.ability.extra.maxHand - 1 then card.ability.extra.currInc = card.ability.extra.perHand * card.ability.extra.maxHand end
            if G.GAME.current_round.hands_played == card.ability.extra.maxHand - 1 then ease_hands_played(card.ability.extra.hands) end
        end

        if context.joker_main then
            local chips = (G.GAME.dollars or G.GAME.dollar_buffer or 0) * (card.ability.extra.dollarPercentage + card.ability.extra.currInc) / 100

            return {
                chips = chips
            }
        end
    end
}