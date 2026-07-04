SMODS.Joker {
    key = 'black_cleaver',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percent = 5,
            maxPercent = 30,
            mult = 20,
            currentPercent = 0,
            originalBlind = 0,
            prevMult = 0,
            currDecrease = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.maxPercent,
                card.ability.extra.mult,
                card.ability.extra.currentPercent,
                card.ability.extra.originalBlind,
                card.ability.extra.prevMult,
                card.ability.extra.currDecrease
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.before and not context.blueprint then
            card.ability.extra.prevMult = mult
        end

        if ((context.individual and context.cardarea == G.play) or (card.area and card.area == G.jokers)) and not context.blueprint and not context.end_of_round and not context.setting_blind then
            if G.GAME.blind.chips ~= nil and card.ability.extra.originalBlind ~= nil and not (tonumber(tostring(G.GAME.blind.chips)) <= tonumber(tostring(card.ability.extra.originalBlind / 2))) and mult ~= card.ability.extra.prevMult and card.ability.extra.currentPercent < card.ability.extra.maxPercent and mult ~= nil and mult ~= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'currentPercent',
                    scalar_value = 'percent'
                    }
                )

                card.ability.extra.currDecrease = card.ability.extra.originalBlind - card.ability.extra.originalBlind * (100 - card.ability.extra.currentPercent) / 100

                G.GAME.blind.chips = G.GAME.blind.chips - (card.ability.extra.originalBlind * card.ability.extra.percent / 100)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                card.ability.extra.prevMult = mult
            end
        end

        if context.joker_main then
            if card.ability.extra.currentPercent >= card.ability.extra.maxPercent or (G.GAME.blind.chips ~= nil and card.ability.extra.originalBlind ~= nil and not (tonumber(tostring(G.GAME.blind.chips)) <= tonumber(tostring(card.ability.extra.originalBlind / 2)))) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        
        if context.end_of_round then
            card.ability.extra.currentPercent = 0
            card.ability.extra.currDecrease = 0
        end
    end,
    add_to_deck = function(self, card, context)
        card.ability.extra.originalBlind = G.GAME.blind.chips
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "totalPercent"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "score"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "newScore"
            },
        text = {
            { ref_table = "card.joker_display_values", ref_value = "score" },
            { scale = 0.4 }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "totalPercent" },
            { text = "% -> " },
            { ref_table = "card.joker_display_values", ref_value = "newScore" },
            { text = ")" }
        }
    }
    end
}