SMODS.Joker {
    key = 'sebr',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 2
    },
    config = {
        extra = {
            chips = 5,
            enhChips = 15,
            totalChips = 0,
            totalEnhCards = 0   
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.enhChips,
                card.ability.extra.totalChips,
                card.ability.extra.totalEnhCards
                    
}
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.totalEnhCards = 0
            for _, playing_card in pairs(G.playing_cards) do
                if next(SMODS.get_enhancements(playing_card)) then
                    if G.GAME.current_round.hands_left == 0 then
                        card.ability.extra.totalEnhCards = card.ability.extra.totalEnhCards + card.ability.extra.enhChips
                    else
                        card.ability.extra.totalEnhCards = card.ability.extra.totalEnhCards + card.ability.extra.chips
                    end
                end
            end
        end

        if context.joker_main then
            card.ability.extra.totalChips = card.ability.extra.totalEnhCards

            return {
                chips = card.ability.extra.totalChips
            }
        end
    end
}