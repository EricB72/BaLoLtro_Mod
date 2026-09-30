SMODS.Joker {
    key = 'manamune',
   atlas = 'league_items_good',
    pos = {
        x = 56,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            mult = 1,
            numOfEnh = 5,
            triggersToEv = 5,
            numOfCardEnh = 1,
            triggers = 0,
            enhCards = 0,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            muramana = 'j_tstmod_muramana',
            cardsToEnh = 2,
            nextEnh = '-',
            enhancement = {'-', '-'}
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.mult end
        end
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.numOfEnh,
                card.ability.extra.triggersToEv,
                card.ability.extra.numOfCardEnh,
                card.ability.extra.triggers,
                card.ability.extra.enhCards,
                card.ability.extra.mod_conv,
                card.ability.extra.muramana,
                enh_Cards,
                card.ability.extra.cardsToEnh,
                card.ability.extra.nextEnh,
                card.ability.extra.enhancement
        }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for i = 1, #context.scoring_hand do -- Checks for every scored card
                if not context.scoring_hand[i].debuff then
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                end
            end

            if card.ability.extra.triggers >= card.ability.extra.numOfEnh then
                local cards_To_Enh = card.ability.extra.cardsToEnh
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                for i = 1, #context.scoring_hand do
                    local _card = context.scoring_hand[i]

                    if not next(SMODS.get_enhancements(_card)) and cards_To_Enh > 0 and not _card.debuff then
                        _card:set_ability(card.ability.extra.enhancement[card.ability.extra.cardsToEnh - cards_To_Enh])
                        cards_To_Enh = cards_To_Enh - 1

                        G.E_MANAGER:add_event(Event({
                                func = function()
                                        card.ability.extra.enhancement[card.ability.extra.cardsToEnh - cards_To_Enh] = card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))]
                                        _card:juice_up()
                                        card.ability.extra.nextEnh = localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement[0] } .. ', ' .. localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement[1] }
                                    return true
                                end
                            }))
                    end
                end
            end
        end

        if context.after and not context.blueprint then
            if card.ability.extra.triggers >= card.ability.extra.numOfEnh then
                card.ability.extra.enhCards = card.ability.extra.enhCards + 1
                card.ability.extra.triggers = 0
            end
        end

        if context.joker_main then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.mult end
            end

            return {
                mult = enh_Cards
            }
        end

        if (context.end_of_round or context.hand_drawn) and not context.blueprint then
               if card.ability.extra.enhCards >= card.ability.extra.triggersToEv then
                SMODS.add_card {
                    key = card.ability.extra.muramana,
                }
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    add_to_deck = function (self, card, context)
        card.ability.extra.enhancement[0] = card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))]
        card.ability.extra.enhancement[1] = card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))]
        card.ability.extra.nextEnh = localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement[0] } .. ', ' .. localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement[1] }
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "mult"
            },
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local enh_Cards = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.mult end
                end

                card.joker_display_values.mult = enh_Cards
            end
        }
    end
}