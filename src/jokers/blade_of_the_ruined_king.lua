SMODS.Joker {
    key = 'bork',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
            percentage = 5,
            timesTo = 3,
            lastNum = 0,
            highCard = 'High Card',
            reset = 0,
            scalar = 1,
            percentageUpg = 30
        }
    },
    rarity = 1,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.timesTo,
                card.ability.extra.lastNum,
                card.ability.extra.highCard,
                card.ability.extra.reset,
                card.ability.extra.percentageUpg
            }
        }
    end,
    calculate = function(self, card, context)
        if context.hand_drawn then
            local eval = function() return card.ability.extra.lastNum >= (card.ability.extra.timesTo - 1) end
            juice_card_until(card, eval, true)
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            elseif context.other_card:get_id() == 13 then
                local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100
                card.ability.extra.lastNum = card.ability.extra.lastNum + card.ability.extra.scalar
                
                if card.ability.extra.lastNum >= (card.ability.extra.timesTo) then
                    addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentageUpg / 100

                    card.ability.extra.lastNum = card.ability.extra.reset
                end

                G.GAME.chips = G.GAME.chips + addedAmount

                return {
                    message = tostring(addedAmount),
                    message_card = card
                }
            end
        end
    end
}