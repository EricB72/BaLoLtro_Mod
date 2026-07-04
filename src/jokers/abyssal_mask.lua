SMODS.Joker {
    key = 'am',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 1.2
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played ~= 0 then
            return {
                xchips = card.ability.extra.chips
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "xchips"
            },
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xchips", retrigger_type = "exp" }
                },
                border_colour = G.C.CHIPS
            }
            },
            calc_function = function(card)
                if G.GAME.current_round.hands_played ~= 0 then
                    card.joker_display_values.xchips = card.ability.extra.chips
                else
                    card.joker_display_values.xchips = 1
                end
            end
        }
    end
}