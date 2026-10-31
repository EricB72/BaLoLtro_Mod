SMODS.Joker {
    key = 'shurelyas_battlesong',
    atlas = 'league_items_good',
    pos = {
        x = 28,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            handSize = 2,
            reduc = 1,
            triggered = false
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.handSize,
                card.ability.extra.reduc,
                card.ability.extra.triggered
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not card.ability.extra.triggered then
            G.hand:change_size(card.ability.extra.handSize * #G.jokers.cards)
            card.ability.extra.triggered = true
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            G.hand:change_size(-card.ability.extra.handSize * #G.jokers.cards)
            card.ability.extra.handSize = card.ability.extra.handSize - card.ability.extra.reduc
            card.ability.extra.triggered = false

            if card.ability.extra.handSize <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_handsize_minus', vars = { card.ability.extra.reduc } },
                    colour = G.C.FILTER
                }
            end
        end
    end,
    add_to_deck = function(self, card, context)
        if G.GAME.blind then
            G.hand:change_size(card.ability.extra.handSize * #G.jokers.cards)
            card.ability.extra.triggered = true
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.triggered then
            G.hand:change_size(-(card.ability.extra.handSize * (#G.jokers.cards)))
        end
    end
}