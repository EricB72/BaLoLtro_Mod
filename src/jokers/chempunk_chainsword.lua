SMODS.Joker {
    key = 'chempunk_chainsword',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 4
    },
    config = {
        extra = {
            mult = 10,
            priceReducion = 4,
            prevMult = 0,
            activations = 0,
            maxPriceReducion = 40,
            currPrice = 0,
            activated = false
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.priceReducion,
                card.ability.extra.prevMult,
                card.ability.extra.activations,
                card.ability.extra.maxPriceReducion,
                card.ability.extra.currPrice,
                card.ability.extra.activated
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.activations = 0
            card.ability.extra.activated = false
        end
        
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.before then
            card.ability.extra.prevMult = mult
        end

        if ((context.individual and context.cardarea == G.play) or (card.area and card.area == G.jokers))and not context.blueprint then
            if mult ~= card.ability.extra.prevMult then
                card.ability.extra.activations = card.ability.extra.activations + 1
                card.ability.extra.prevMult = mult
            end

            card.ability.extra.currPrice = card.ability.extra.priceReducion * card.ability.extra.activations

            if card.ability.extra.currPrice > card.ability.extra.maxPriceReducion then
                card.ability.extra.currPrice = card.ability.extra.maxPriceReducion
            end
        end

        if ((not card.ability.extra.activated and G.shop) or context.reroll_shop) and not G.GAME.shop_free then
            if G.shop_jokers and G.shop_booster then
                for _, cards in pairs(G.shop_jokers.cards) do
                    cards.cost = cards.cost * (1 - card.ability.extra.currPrice / 100)
                end
                if card.ability.extra.activated == false then
                    for _, booster in pairs(G.shop_booster.cards) do
                    booster.cost = booster.cost * (1 - card.ability.extra.currPrice / 100)
                    end
                end
                card.ability.extra.activated = true
            end
        end
    end
}