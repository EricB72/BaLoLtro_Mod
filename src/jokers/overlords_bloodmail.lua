SMODS.Joker {
    key = 'overlords_bloodmail',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 14
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            xmultGain = 0.1,
            percent = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultGain,
                card.ability.extra.percent
            }
        }
    end,
    calculate = function(self, card, context)
        local sellValue = 0

        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            sellValue = sellValue + joker.sell_cost
        end

        card.ability.extra.xmult = 1 + sellValue * card.ability.extra.xmultGain
        card.ability.extra.percent = 0

        if G.GAME.blind.chips > 0 then
            card.ability.extra.percent = (G.GAME.chips / G.GAME.blind.chips) * 100
            card.ability.extra.xmult = 1 + sellValue * card.ability.extra.xmultGain * (1 + card.ability.extra.percent / 100)
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "xmult"
            },
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
            },
            calc_function = function(card)
                local sellValue = 0

                for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                    sellValue = sellValue + joker.sell_cost
                end

                card.joker_display_values.xmult = 1 + sellValue * card.ability.extra.xmultGain

                if G.GAME.blind.chips > 0 then
                    card.joker_display_values.xmult = 1 + sellValue * card.ability.extra.xmultGain * (1 + (G.GAME.chips / G.GAME.blind.chips))
                end
            end
        }
    end
}