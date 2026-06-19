SMODS.Joker {
    key = 'bork',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
            percentage = 10,
            timesTo = 3,
            lastNum = 0,
            highCard = 'High Card',
            reset = 0,
            scalar = 1,
            percentageUpg = 30
        }
    },
    rarity = 3,
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
        if context.joker_main and context.scoring_name == card.ability.extra.highCard then
            local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100
            card.ability.extra.lastNum = card.ability.extra.lastNum + card.ability.extra.scalar
            
            if card.ability.extra.lastNum >= (card.ability.extra.timesTo) then
                addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentageUpg / 100

                card.ability.extra.timesTo = card.ability.extra.reset
                card.ability.extra.lastNum = card.ability.extra.reset
            end

            G.GAME.chips = G.GAME.chips + addedAmount

            return {
                message = tostring(addedAmount)
            }
        end
    end
}