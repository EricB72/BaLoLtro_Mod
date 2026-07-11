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
            currDecrease = 0,
            totalMaxPerc = 30
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
                card.ability.extra.currDecrease,
                card.ability.extra.totalMaxPerc
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.setting_blind or context.before then
            card.ability.extra.prevMult = SMODS.get_scoring_parameter('mult', flames)
        end

        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand or card.area == G.jokers) and card.ability.extra.prevMult ~= SMODS.get_scoring_parameter('mult', flames) and not context.end_of_round then
            if card.ability.extra.currentPercent < card.ability.extra.maxPercent and G.GAME.blind.chips / card.ability.extra.originalBlind <= 100 - card.ability.extra.totalMaxPerc then
                card.ability.extra.currDecrease = card.ability.extra.originalBlind - card.ability.extra.originalBlind * (100 - card.ability.extra.currentPercent) / 100
                
                card.ability.extra.prevMult = SMODS.get_scoring_parameter('mult', flames)

                return {
                    blindsize = -(card.ability.extra.originalBlind * card.ability.extra.percent / 100)
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.currentPercent >= card.ability.extra.maxPercent then
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
            },
            calc_function = function(card)
                local count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()

                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        
                    end
                end

                card.joker_display_values.score = 0
                card.joker_display_values.totalPercent = 0
                card.joker_display_values.newScore = 0
                
                if card.ability.extra.currentPercent >= card.ability.extra.maxPercent then
                    card.joker_display_values.totalPercent = card.ability.extra.maxPercentage
                    card.joker_display_values.score = '-'
                    card.joker_display_values.newScore = G.GAME.blind.chips
                end
            end
        }
    end
}