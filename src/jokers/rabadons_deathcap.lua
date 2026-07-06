SMODS.Joker {
    key = 'rdc',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            highCard = 'High Card',
            percentage = 1.3,
            xchips = 1.3,
            xmult = 1.3
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.percentage,
                card.ability.extra.xchips,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name ~= card.ability.extra.highCard then
            return {
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
            {
                border_nodes = {
                    { text = "X", border_colour = G.C.CHIPS},
                    { ref_table = "card.ability.extra", ref_value = "xchips", retrigger_type = "exp", border_colour = G.C.CHIPS },
                    { text = ", " },
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
            }
        }
    end
}