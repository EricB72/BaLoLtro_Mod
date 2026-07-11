SMODS.Joker {
    key = 'hullbreaker',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            hands = 3,
            percent = 10
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        local dollMult = (G.GAME.dollars or G.GAME.dollar_buffer or 0)
        local dollXMult = 1 + (G.GAME.dollars or G.GAME.dollar_buffer or 0) / card.ability.extra.percent

        return {
            vars = {
                dollMult,
                dollXMult,
                card.ability.extra.hands,
                card.ability.extra.percent
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local eval = function(card) return G.GAME.current_round.hands_played ~= 0 and (G.GAME.current_round.hands_played + 1) % card.ability.extra.hands == 0 end
            juice_card_until(card, eval, true)
        end

        if context.joker_main then
            if G.GAME.current_round.hands_played ~= 0 and (G.GAME.current_round.hands_played + 1) % card.ability.extra.hands == 0 then
                local dollMult = (G.GAME.dollars or G.GAME.dollar_buffer or 0)
                local dollXMult = 1 + (G.GAME.dollars or G.GAME.dollar_buffer or 0) / card.ability.extra.percent

                if G.GAME.blind.boss then
                    return {
                        mult = dollMult,
                        xmult = dollXMult
                    }
                else
                    return {
                        mult = dollMult
                    }
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "mult"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "xmult"
            },
            text = {
                { text = "+", colour = G.C.MULT},
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
                { text = ", " },

                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            reminder_text = {
                { text = "(Every " },
                { ref_table = "card.ability.extra", ref_value = "hands", colour = G.C.GOLD },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.mult = 0
                card.joker_display_values.xmult = 1

                if G.GAME.current_round.hands_played ~= 0 and (G.GAME.current_round.hands_played + 1) % card.ability.extra.hands == 0 then
                    card.joker_display_values.mult = (G.GAME.dollars or G.GAME.dollar_buffer or 0)

                    if G.GAME.blind.boss then
                        card.joker_display_values.xmult = 1 + (G.GAME.dollars or G.GAME.dollar_buffer or 0) / card.ability.extra.percent
                    end
                end
            end
        }
    end
}