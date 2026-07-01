SMODS.Joker {
    key = 'bork',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 5,
            highCard = 'King'
        }
    },
    rarity = 1,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.highCard
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            elseif context.other_card:get_id() == 13 then
                local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100

                G.GAME.chips = G.GAME.chips + addedAmount

                return {
                    message = tostring(addedAmount),
                    message_card = card
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "totalPercent"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "count"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "king"
            },
        text = {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "exp" },
            { scale = 0.4 }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "totalPercent" },
            { text = "%)" }
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() == 13 then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end

            local chipDiference = G.GAME.blind.chips - G.GAME.chips
            local addedAmount = chipDiference * card.ability.extra.percentage / 100
            card.joker_display_values.count = 0

            for i = 1, count do
                card.joker_display_values.count = card.joker_display_values.count + addedAmount
                
                chipDiference = chipDiference - addedAmount
                addedAmount = chipDiference * card.ability.extra.percentage / 100
            end

            card.joker_display_values.totalPercent = card.joker_display_values.count / (G.GAME.blind.chips - G.GAME.chips) * 100
        end
        }
    end
}