SMODS.Joker {
    key = 'ymgb',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            handSize = 1,
            handSizeSell = 5,
            triggered = false
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.handSize,
                card.ability.extra.handSizeSell,
                card.ability.extra.triggered
}
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            G.hand:change_size(card.ability.extra.handSize)
            card.ability.extra.triggered = true
        end

        if ((context.hand_drawn and not context.first_hand_drawn) or context.end_of_round) and card.ability.extra.triggered and not context.blueprint then
            G.hand:change_size(-card.ability.extra.handSize)
            card.ability.extra.triggered = false
        end

        if context.selling_self and not context.blueprint then
            if G.GAME.blind then
                return {
                    G.hand:change_size(card.ability.extra.handSizeSell)
                }
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handSizeSell)
    end,
}