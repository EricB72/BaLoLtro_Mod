SMODS.Joker {
    key = 'sf',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = {
            maxPercentage = 40,
            percentage = 120,
            scalar = 0,
            lastNum = 0,
            originalBlind = 0,
            highCard = 'High Card'
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.maxPercentage,
                card.ability.extra.percentage,
                card.ability.extra.scalar,
                card.ability.extra.lastNum,
                card.ability.extra.originalBlind,
                card.ability.extra.highCard
            }
        }
    end,
    calculate = function(self, card, context)
        local new = false

        if context.before then
            card.ability.extra.originalBlind = G.GAME.blind.chips
            card.ability.extra.scalar = G.GAME.chips
        end

        if context.joker_main and context.scoring_name ~= card.ability.extra.highCard and not context.blueprint then
            card.ability.extra.lastNum = card.ability.extra.scalar / card.ability.extra.originalBlind * 100

            if tonumber(tostring(card.ability.extra.lastNum)) >= tonumber(tostring(100 - card.ability.extra.maxPercentage)) then
                return {
                    xchips = 1.2,
                    xmult = 1.2
                }
            end   
        end
    end
}