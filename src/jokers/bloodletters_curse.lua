SMODS.Joker {
    key = 'blc',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            maxPercentage = 30,
            percentage = 0,
            scalar = 3.75,
            lastNum = 0,
            originalBlind = 0,
            prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            amount = 1,
            totalMaxPerc = 30
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.maxPercentage,
                card.ability.extra.percentage,
                card.ability.extra.scalar,
                card.ability.extra.lastNum,
                card.ability.extra.originalBlind,
                card.ability.extra.prevCards,
                card.ability.extra.amount,
                card.ability.extra.totalMaxPerc
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.debuff then
                return {
                    message_card = card,
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            elseif (G.GAME.blind.chips / card.ability.extra.originalBlind <= 100 - card.ability.extra.totalMaxPerc) then
                local new = true

                for i = 1, #card.ability.extra.prevCards do
                    if context.other_card.base.id == card.ability.extra.prevCards[i] then
                        new = false
                        i = #card.ability.extra.prevCards
                    end
                end

                if card.ability.extra.percentage < card.ability.extra.maxPercentage and new then
                    card.ability.extra.lastNum = card.ability.extra.originalBlind - (card.ability.extra.originalBlind * (100 - card.ability.extra.percentage) / 100)
                    
                    card.ability.extra.prevCards[card.ability.extra.amount] = context.other_card.base.id
                    card.ability.extra.amount = card.ability.extra.amount + 1

                    return {
                        blindsize = -(card.ability.extra.originalBlind * card.ability.extra.scalar / 100)
                    }
                end
            end
        end
        
        if context.end_of_round then
            card.ability.extra.prevCards = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
            card.ability.extra.amount = 1  
            card.ability.extra.percentage = 0
            card.ability.extra.lastNum = 0
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
                ref_value = "missingRanks"
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
        extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "missingRanks" }
        }
        },
        extra_config = { colour = G.C.MULT, scale = 0.2 },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            local ranks = {}
            local rankCount = 0

            for i = 1, #card.ability.extra.prevCards do
                ranks[i] = card.ability.extra.prevCards[i]
                if card.ability.extra.prevCards[i] == 0 then
                    rankCount = rankCount + 1
                end
            end

            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    local newRank = true

                    for i = 1, #ranks do
                        if scoring_card.base.id == ranks[i] then
                            newRank = false
                            break
                        end
                    end

                    if newRank then
                        count = count + 1
                        ranks[#ranks - rankCount + count] = scoring_card.base.id
                    end
                end
            end

            card.joker_display_values.score = count * (card.ability.extra.originalBlind * card.ability.extra.scalar / 100)
            card.joker_display_values.totalPercent = card.ability.extra.scalar * count
            card.joker_display_values.newScore = G.GAME.blind.chips - card.joker_display_values.score
            
            card.joker_display_values.missingRanks = ''
            for i = 1, #card.ability.extra.prevCards - rankCount do
                local rank = tostring(card.ability.extra.prevCards[i])

                if rank == '14' then
                    rank = 'A'
                elseif rank == '13' then
                    rank = 'K'
                elseif rank == '12' then
                    rank = 'Q'
                elseif rank == '11' then
                    rank = 'J'
                end
                
                if i ~= #card.ability.extra.prevCards - rankCount then
                    card.joker_display_values.missingRanks = card.joker_display_values.missingRanks .. rank ..', '
                else
                    card.joker_display_values.missingRanks = card.joker_display_values.missingRanks .. rank
                end
            end
            card.joker_display_values.missingRanks = card.joker_display_values.missingRanks .. ')'

            if card.ability.extra.percentage >= card.ability.extra.maxPercentage then
                card.joker_display_values.totalPercent = card.ability.extra.maxPercentage
                card.joker_display_values.score = '-'
                card.joker_display_values.newScore = G.GAME.blind.chips
            end

            if rankCount == 13 then
                card.joker_display_values.missingRanks = ')'
            end
        end
        }
    end
}