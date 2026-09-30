SMODS.Joker {
    key = 'warmogs_armor',
    atlas = 'league_items_good',
    pos = {
        x = 50,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            increase = 5,
            bankrupt_at = 10
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.increase,
                card.ability.extra.bankrupt_at
            }
        }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and math.floor(G.GAME.dollars) < 0 and not context.blueprint then
                card.ability.extra.bankrupt_at = card.ability.extra.bankrupt_at + card.ability.extra.increase
                G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.increase
        else
            G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at - 10
            card.ability.extra.bankrupt_at = 10
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
    end
}