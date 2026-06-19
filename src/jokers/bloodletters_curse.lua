SMODS.Joker {
    key = 'blc',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            maxPercentage = 30,
            percentage = 0,
            scalar = 3.75,
            lastNum = 0,
            originalBlind = 0
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
                card.ability.extra.originalBlind
            }
        }
    end,
    calculate = function(self, card, context)
        local new = true

        if prevCards == nil then
            prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
        end

        if amount == nil then
            amount = 1
        end

        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            for i = 1, #prevCards do
                if context.other_card:get_id() == prevCards[i] then
                    new = false
                    i = #prevCards
                end
            end

            if card.ability.extra.percentage < card.ability.extra.maxPercentage and new then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'percentage',
                    scalar_value = 'scalar',
                    message_colour = G.C.PURPLE
                })

                card.ability.extra.lastNum = card.ability.extra.originalBlind - (card.ability.extra.originalBlind * (100 - card.ability.extra.percentage) / 100)

                G.GAME.blind.chips = card.ability.extra.originalBlind - card.ability.extra.lastNum
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                prevCards[amount] = context.other_card:get_id()
                amount = amount + 1
            end
        end
        
        if context.end_of_round then
            prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
            amount = 1  
            card.ability.extra.percentage = 0
            card.ability.extra.lastNum = 0
        end
    end,
    add_to_deck = function(self, card, context)
        card.ability.extra.originalBlind = G.GAME.blind.chips
    end
}