SMODS.Joker {
    key = 'echoes_of_helia',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 1,
            chips = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local scoreDone = ((G.GAME.chips * card.ability.extra.percentage / 100) or 0)
        return {
            vars = {
                scoreDone,
                card.ability.extra.chips,
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played ~= 0 and not context.blueprint then
            local scoreDone = ((G.GAME.chips * card.ability.extra.percentage / 100) or 0)

            card.ability.extra.chips = scoreDone
        end

        if context.final_scoring_step then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and not context.blueprint then
            card.ability.extra.chips = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.CHIPS },
        }
    end
}