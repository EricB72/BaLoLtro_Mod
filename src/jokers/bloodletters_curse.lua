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
            originalBlind = 0,
            prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            amount = 1
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
                card.ability.extra.prevCards,
                card.ability.extra.amount
            }
        }
    end,
    calculate = function(self, card, context)
        local new = true

        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.debuff then
                return {
                    message_card = card,
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            elseif not G.GAME.blind.chips <= card.ability.extra.originalBlind / 2 then
                for i = 1, #card.ability.extra.prevCards do
                if context.other_card:get_id() == card.ability.extra.prevCards[i] then
                    new = false
                    i = #card.ability.extra.prevCards
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

                    G.GAME.blind.chips = G.GAME.blind.chips - (card.ability.extra.originalBlind * card.ability.extra.scalar / 100)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    
                    card.ability.extra.prevCards[card.ability.extra.amount] = context.other_card:get_id()
                    card.ability.extra.amount = card.ability.extra.amount + 1
                end
            end
        end
        
        if context.end_of_round then
            card.ability.extra.prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
            card.ability.extra.amount = 1  
            card.ability.extra.percentage = 0
            card.ability.extra.lastNum = 0
        end
    end,
    add_to_deck = function(self, card, context)
        card.ability.extra.originalBlind = G.GAME.blind.chips
    end
}