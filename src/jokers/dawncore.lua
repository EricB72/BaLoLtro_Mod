SMODS.Joker {
    key = 'dawncore',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xchips = 1,
            chipGain = 0.05,
            retrigger = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + 1 end
        end
        local x_Chips = 1
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then x_Chips = x_Chips + card.ability.extra.chipGain end
        end
        local total_Deck = 52
        return {
            vars = {
                x_Chips,
                card.ability.extra.chipGain,
                enh_Cards,
                total_Deck,
                card.ability.extra.retrigger
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + 1 end
            end

            local total_Deck = #G.playing_cards

            if enh_Cards >= total_Deck then
                card.ability.extra.retrigger = 2
            else
                card.ability.extra.retrigger = 0
            end            
        end

        if context.repetition and context.cardarea == G.play then
            if card.ability.extra.retrigger > 0 then
                return {
                    repetitions = card.ability.extra.retrigger
                }
            end
        end
        
        if context.joker_main then
            local x_Chips = 1
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then x_Chips = x_Chips + card.ability.extra.chipGain end
            end

            return {
                xchips = x_Chips
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = 'card.joker_display_values',
                ref_value = 'xchips'
            },
            {
                ref_table = 'card.joker_display_values',
                ref_value = 'enhCards'
            },
            {
                ref_table = 'card.joker_display_values',
                ref_value = 'totalDeck'
            },
            text =
            {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xchips", retrigger_type = "exp" }
                    },
                    border_colour = G.C.CHIPS
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "enhCards" },
                { text = " / " },
                { ref_table = "card.joker_display_values", ref_value = "totalDeck" },
                { text = ")" }
            },
            calc_function = function(card)
                if G.play then
                    local enh_Cards = 0
                    for _, playing_card in pairs(G.playing_cards or {}) do
                        if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + 1 end
                    end
                    local x_Chips = 1
                    for _, playing_card in pairs(G.playing_cards or {}) do
                        if next(SMODS.get_enhancements(playing_card)) then x_Chips = x_Chips + card.ability.extra.chipGain end
                    end
                    local total_Deck = #G.playing_cards

                    card.joker_display_values.xchips = x_Chips
                    card.joker_display_values.enhCards = enh_Cards
                    card.joker_display_values.totalDeck = total_Deck
                end
            end
        }
    end
}