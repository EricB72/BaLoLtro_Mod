SMODS.Joker {
    key = 'maw_of_malmortius',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 12
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 5,
            chipGain = 5,
            mult = 5,
            multGain = 5
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.mult,
                card.ability.extra.multGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.debuffed_hand then
            if G.GAME.blind.triggered then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multGain
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
                { text = ", " },
                { text = "+", colour = G.C.MULT },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
                { scale = 0.4 }
            },
        }
    end
}