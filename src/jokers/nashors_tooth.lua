SMODS.Joker {
    key = 'nashors_tooth',
    atlas = 'common_league_items',
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 20
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker:is_rarity("Common") then
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
                ref_value = "commonJokers"
            },
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "commonJokers", colour = G.C.CHIPS },
            },
            reminder_text = {
                { text = "(" },
                { text = "Common", colour = G.C.BLUE },
                { text = ")" },
            },
            calc_function = function(card)
                local jokers = 0
                
                for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                    if joker:is_rarity("Common") then jokers = jokers + 1 end
                end
                card.joker_display_values.commonJokers = jokers * card.ability.extra.chips
            end
        }
    end
}