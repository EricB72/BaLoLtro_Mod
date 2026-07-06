SMODS.Joker {
    key = 'manamune',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 12
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 1,
            HandNum = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enh_Cards = enh_Cards + card.ability.extra.mult end
        end
        return {
            vars = {
                card.ability.extra.mult,
                enh_Cards
            }
        }
    end,
    calculate = function(self, card, context)
        --if context.using_consumeable 
    end
}