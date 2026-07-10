SMODS.Joker {
    key = 'umbral_glaive',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 20
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 3,
            hydras = 2,
            wildCards = {0, 0, 0, 0, 0},
            hydraInc = 2
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_hydra' }
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.hydras,
                card.ability.extra.wildCards,
                card.ability.extra.hydraInc
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_hydra'), G.C.GREEN, G.C.MULT, 1.2 )
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.boss then
            G.from_boss_tag = true
            G.FUNCS.reroll_boss()
        end

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

        if context.individual and context.cardarea == G.play then
            local numerator = 0

            for i = 1, #context.scoring_hand do
                if context.other_card == context.scoring_hand[i] and next(SMODS.get_enhancements(context.other_card)) == 'm_wild' then
                    numerator = i
                    break
                end
            end

            if numerator > 0 then
                return {
                    mult = card.ability.extra.mult * card.ability.extra.wildCards[numerator]
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "totMult"
            },
            text = {
                { text = "+", colour = G.C.MULT},
                { ref_table = "card.joker_display_values", ref_value = "totMult", retrigger_type = "mult", colour = G.C.MULT }
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

                    card.joker_display_values.totMult = 3 * numerator
                else
                    card.joker_display_values.totMult = 0
                end
            end
        }
    end
}