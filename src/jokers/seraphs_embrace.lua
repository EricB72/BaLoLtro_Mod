SMODS.Joker {
    key = 'sebr',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 5,
            enhChips = 15
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then 
                if G.GAME.current_round.hands_left <= 1 then
                    enh_Cards = enh_Cards + card.ability.extra.enhChips
                else
                    enh_Cards = enh_Cards + card.ability.extra.chips
                end
            end
        end
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.enhChips,
                enh_Cards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then 
                    if G.GAME.current_round.hands_left == 0 then
                        enh_Cards = enh_Cards + card.ability.extra.enhChips
                    else
                        enh_Cards = enh_Cards + card.ability.extra.chips
                    end
                end
            end

            return {
                chips = enh_Cards
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end
}