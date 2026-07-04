SMODS.Joker {
    key = 'deaths_dance',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 0,
            everyX = 2,
            currentRerolls = 0,
            moneySaved = 0,
            reset = 0,
            rerollNum = 0,
            realReroll = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.everyX,
                card.ability.extra.mult,
                card.ability.extra.moneySaved,
                card.ability.extra.reset,
                card.ability.extra.rerollNum,
                card.ability.extra.currentRerolls,
                card.ability.extra.realReroll
            }
        }
    end,
    calculate = function(self, card, context)
        if G.shop and card.ability.extra.realReroll == 0 then
            card.ability.extra.realReroll = G.GAME.round_resets.reroll_cost
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.currentRerolls = card.ability.extra.currentRerolls + 1
            card.ability.extra.realReroll = card.ability.extra.realReroll + 1

            card.ability.extra.moneySaved = card.ability.extra.moneySaved + (card.ability.extra.realReroll - (card.ability.extra.realReroll - card.ability.extra.rerollNum))
            
            if card.ability.extra.currentRerolls >= card.ability.extra.everyX then
                card.ability.extra.currentRerolls = 0
            else
                card.ability.extra.rerollNum = card.ability.extra.rerollNum + 1
            end

            G.GAME.current_round.reroll_cost = math.max(0, card.ability.extra.realReroll - card.ability.extra.rerollNum)
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.moneySaved
            }
        end

        if context.end_of_round then
            card.ability.extra.moneySaved = 0
            card.ability.extra.rerollNum = 0
            card.ability.extra.currentRerolls = 0
            card.ability.extra.realReroll = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "moneySaved", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.MULT },
        }
    end
}