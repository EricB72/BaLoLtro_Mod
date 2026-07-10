SMODS.Joker {
    key = 'stridebreaker',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 18
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xchips = 1.5,
            hydras = 2,
            wildCards = {0, 0, 0, 0, 0},
            hydraInc = 2,
            handSize = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_hydra' }
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.hydras,
                card.ability.extra.wildCards,
                card.ability.extra.hydraInc,
                card.ability.extra.handSize
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_hydra'), G.C.GREEN, G.C.MULT, 1.2 )
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            --Each Hydra
            card.ability.extra.hydras = 0

            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Hydra') or string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Umbral Glaive') or string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Stridebreaker') then
                    card.ability.extra.hydras = card.ability.extra.hydras + card.ability.extra.hydraInc
                end
            end

            card.ability.extra.wildCards = {0, 0, 0, 0, 0}

            local adj = card.ability.extra.hydras
            local handCard = 0

            for i = 1, adj do
                if next(SMODS.get_enhancements(context.scoring_hand[i - handCard])) == 'm_wild' then
                    card.ability.extra.wildCards[i - handCard] = card.ability.extra.wildCards[i - handCard] + 1
                end

                if i >= #context.scoring_hand + handCard then
                    handCard = handCard + #context.scoring_hand
                end
            end
        end

        if (context.after or context.pre_discard) and not context.blueprint then
            card.ability.extra.handSize = 0

            for i = 1, #G.hand.cards do
                if next(SMODS.get_enhancements(G.hand.cards[i])) == 'm_wild' then card.ability.extra.handSize = card.ability.extra.handSize + 1 end
            end

            G.hand:change_size(card.ability.extra.handSize)
        end

        if (context.hand_drawn or (G.GAME.blind and context.end_of_round and context.game_over == false and context.main_eval)) and not context.blueprint then
            G.hand:change_size(-card.ability.extra.handSize)
            card.ability.extra.handSize = 0
        end

        if context.individual and context.cardarea == G.play then
            local numerator = 0

            for i = 1, #context.scoring_hand do
                if context.other_card == context.scoring_hand[i] and next(SMODS.get_enhancements(context.other_card)) == 'm_wild' then
                    numerator = i
                    break
                end
            end


            if numerator > 0 then
                local xchips = card.ability.extra.xchips ^ card.ability.extra.wildCards[numerator]

                if xchips > 1 then
                    return {
                        xchips = xchips
                    }
                end
                
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "totXChips"
            },
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "totXChips", retrigger_type = "exp" }
                },
                border_colour = G.C.CHIPS
            },
            },
            reminder_text = {
                { text = '(' },
                { text = 'Wild Card', colour = G.C.GOLD},
                { text = ')' }
            },
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()

                if text ~= "Unknown" and #scoring_hand > 0 then
                    local cards = {0, 0, 0, 0, 0}
                    local hydras = 0

                    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                        if string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Hydra') or string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Umbral Glaive') or string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Stridebreaker') then
                            hydras = hydras + card.ability.extra.hydraInc
                        end
                    end

                    local hand_Card = 0
                    local adj = hydras

                    for i = 1, adj do
                        local _, scoring_card = pairs(scoring_hand[i - hand_Card])

                        if next(SMODS.get_enhancements(scoring_card)) == 'm_wild' and not scoring_card.debuff then
                            cards[i - hand_Card] = cards[i - hand_Card] + 1
                        end

                        if i >= #scoring_hand + hand_Card then
                            hand_Card = hand_Card + #scoring_hand
                        end
                    end

                    local numerator = 0

                    for i = 1, #cards do
                        numerator = numerator + cards[i]
                    end
                    card.joker_display_values.totXChips = 1.5 ^ numerator
                else
                    card.joker_display_values.totXChips = 1
                end
            end
        }
    end
}