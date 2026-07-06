SMODS.Joker {
    key = 'profane_hydra',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 14
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1.75,
            hydras = 1,
            wildCards = {0, 0, 0, 0, 0}
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.hydras,
                card.ability.extra.wildCards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            --Each Hydra
            card.ability.extra.hydras = 0

            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Hydra') then
                    card.ability.extra.hydras = card.ability.extra.hydras + 1
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
                    xmult = card.ability.extra.xmult ^ card.ability.extra.wildCards[numerator]
                }
            end
        end
    end
}