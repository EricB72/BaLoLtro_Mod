SMODS.Joker {
    key = 'acs',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 2,
            numOfEnh = 5,
            triggersToEv = 5,
            numOfCardEnh = 1,
            triggers = 0,
            enhCards = 0,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            seraphs = 'j_tstmod_sebr',
            cardsToEnh = 2
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.chips end
        end
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.numOfEnh,
                card.ability.extra.triggersToEv,
                card.ability.extra.numOfCardEnh,
                card.ability.extra.triggers,
                card.ability.extra.enhCards,
                card.ability.extra.mod_conv,
                card.ability.extra.seraphs,
                enh_Cards,
                card.ability.extra.cardsToEnh
        }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.scoring_hand do -- Checks for every scored card
                if not context.scoring_hand[i].debuff then
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                end
            end

            if card.ability.extra.triggers >= card.ability.extra.numOfEnh then
                local cards_To_Enh = card.ability.extra.cardsToEnh
                
                for i = 1, #G.hand.cards do
                    if not next(SMODS.get_enhancements(G.hand.cards[i])) and not G.hand.cards[i].debuff and cards_To_Enh > 0 then
                        G.hand.cards[i]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])

                        cards_To_Enh = cards_To_Enh - 1
                    end
                end

                if cards_To_Enh ~= card.ability.extra.cardsToEnh then
                    card.ability.extra.enhCards = card.ability.extra.enhCards + 1
                    card.ability.extra.triggers = card.ability.extra.triggers - card.ability.extra.numOfEnh
                end
            end
        end

        if context.joker_main then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.chips end
            end

            return {
                chips = enh_Cards
            }
        end

        if context.end_of_round or context.hand_drawn then
               if card.ability.extra.enhCards >= card.ability.extra.triggersToEv then
                SMODS.add_card {
                    key = card.ability.extra.seraphs,
                }
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "chips"
            },
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                local enh_Cards = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.chips end
                end

                card.joker_display_values.chips = enh_Cards
            end
        }
    end
}