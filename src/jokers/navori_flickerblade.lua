SMODS.Joker {
    key = 'navori_flickerblade',
    atlas = 'league_items_good',
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            cardAmount = 0,
            handsReset = 0
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cardAmount,
                card.ability.extra.handsReset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            card.ability.extra.cardAmount = #context.scoring_hand
        end

        if context.setting_blind and card.ability.extra.cardAmount > 0 then
            if G.GAME.round_resets.hands ~= 0 then card.ability.extra.handsReset = G.GAME.round_resets.hands end
            G.GAME.round_resets.hands = 0
            G.GAME.current_round.hands_left = 0
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_hands_played(card.ability.extra.cardAmount)
                    SMODS.calculate_effect(
                        { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                        context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.handsReset
    end,
}