SMODS.Joker {
    key = 'blackfire_torch',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 0,
            increase = 1
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.increase
            }
        }
    end,
    calculate = function(self, card, context)
        local new = true
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.before then
            card.ability.extra.prevMult = mult
        end

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
            return {
                chips = card.ability.extra.chips
            }
        end
        
        if context.end_of_round then
            card.ability.extra.chips = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "totalChips"
            },
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "totalChips", retrigger_type = "mult" },
            { scale = 0.4 }
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local count = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not playing_card.debuff then
                        count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end

            count = count + card.ability.extra.chips
            card.joker_display_values.totalChips = ((count * (count + 1)) / 2) - (((card.ability.extra.chips) * (card.ability.extra.chips + 1)) / 2) --N'th triangle number
        end
        }
    end
}