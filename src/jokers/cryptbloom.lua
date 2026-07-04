SMODS.Joker {
    key = 'cryptbloom',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 30,
            chipGain = 10,
            dicardGain = 1,
            discards = 0
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.dicardGain,
                card.ability.extra.discards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            ease_discard(card.ability.extra.discards)
        end

        if context.after then
            card.ability.extra.currentPercent = tonumber(tostring((1 - (G.GAME.blind.chips / card.ability.extra.originalBlind)) * 100))
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'chips',
                    scalar_value = 'chipGain',
                    message_colour = G.C.BLUE
                    }
                )

            if G.GAME.blind.boss then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'discards',
                    scalar_value = 'dicardGain',
                    message_colour = G.C.RED
                    }
                )
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = ""
            },
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                
            end
        }
    end
}