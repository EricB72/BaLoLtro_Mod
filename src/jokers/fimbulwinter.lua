SMODS.Joker {
    key = 'fimbulwinter',
    atlas = 'league_items_good',
    pos = {
        x = 29,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            xchips = 0.15,
            gold = 'm_gold'
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) and next(SMODS.get_enhancements(playing_card)) == 'm_gold' then
                enh_Cards = enh_Cards + 0.15
            end
        end
        enh_Cards = 1 + enh_Cards
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.gold,
                enh_Cards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) and next(SMODS.get_enhancements(playing_card)) == card.ability.extra.gold then
                    enh_Cards = enh_Cards + card.ability.extra.xchips
                end
            end
            return {
                xchips = 1 + enh_Cards
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end
}