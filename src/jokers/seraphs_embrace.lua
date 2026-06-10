SMODS.Joker {
    key = 'sec',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 2
    },
    config = {
        extra = {
            chips = 2,
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
        }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local enchCards = 0
            for _, playing_card in pairs(G.playing_cards) do
                if next(SMODS.get_enhancements(playing_card)) then enchCards = enchCards + 1 end
            end

            return {
                chips = card.ability.extra.chips * enchCards
            }
        end
    end
}