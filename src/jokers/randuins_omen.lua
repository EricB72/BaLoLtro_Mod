SMODS.Joker {
    key = 'randuins_omen',
    atlas = 'common_league_items',
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 75
        }
    },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self and G.shop then
            if G.shop_jokers and G.shop_booster then
                for _, cards in pairs(G.shop_jokers.cards) do
                    cards.cost = cards.cost * (1 - card.ability.extra.percentage / 100)
                end

                for _, cards in pairs(G.shop_booster.cards) do
                    cards.cost = cards.cost * (1 - card.ability.extra.percentage / 100)
                end
            end
        end
    end
}