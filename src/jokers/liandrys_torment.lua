SMODS.Joker {
    key = 'liandrys_torment',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 1,
            increase = 3
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.increase
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if next(SMODS.get_enhancements(context.other_card)) then
                local addedAmount = 0

                if context.other_card.edition ~= nil or context.other_card.gold_seal ~= nil or context.other_card.seal ~= nil then
                    addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.increase / 100
                else
                    addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100
                end

                return {
                    score = addedAmount,
                    message_colour = G.C.purple
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
        text = {
            { ref_table = "card.joker_display_values", ref_value = "count" },
            { scale = 0.4 }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "totalPercent" },
            { text = "%)" }
        },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local count = 0
            local upgCount = 0

            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not (playing_card.facing == 'back') and not playing_card.debuff and next(SMODS.get_enhancements(playing_card)) then
                        if playing_card.edition ~= nil or playing_card.gold_seal ~= nil or playing_card.seal ~= nil then
                            upgCount = upgCount + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        else
                            count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)                        
                        end
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

            addedAmount = chipDiference * card.ability.extra.increase / 100

            for i = 1, upgCount do
                card.joker_display_values.count = card.joker_display_values.count + addedAmount
                
                chipDiference = chipDiference - addedAmount
                addedAmount = chipDiference * card.ability.extra.increase / 100
            end

            card.joker_display_values.totalPercent = card.joker_display_values.count / (G.GAME.blind.chips - G.GAME.chips) * 100
        end
        }
    end
}