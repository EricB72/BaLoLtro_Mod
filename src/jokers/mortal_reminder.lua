SMODS.Joker {
    key = 'mortal_reminder',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 13
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            currPrice = 50,
            activated = false,
            activatedBooster = false
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.currPrice,
                card.ability.extra.activated,
                card.ability.extra.activatedBooster
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop then 
            card.ability.extra.activated = false
        end

        if not card.ability.extra.activated and (G.shop or context.reroll_shop) and not G.GAME.shop_free then
            if G.shop_jokers and G.shop_booster then
                for _, cards in pairs(G.shop_jokers.cards) do
                    cards.cost = cards.cost * (1 - card.ability.extra.currPrice / 100)
                end

                if not card.ability.extra.activatedBooster then
                    for _, cards in pairs(G.shop_booster.cards) do
                        cards.cost = cards.cost * (1 - card.ability.extra.currPrice / 100)
                    end

                    card.ability.extra.activatedBooster = true
                end

                card.ability.extra.activated = true
            end
        end

        if context.ending_shop then
            card.ability.extra.activated = false
            card.ability.extra.activatedBooster = false
        end
    end
}