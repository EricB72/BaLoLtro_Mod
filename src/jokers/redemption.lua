SMODS.Joker {
    key = 'redemption',
    atlas = 'uncommon_league_items',
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            rounds = 0,
            total_rounds = 2,
            multiplier = 2
        }
    },
    rarity = 2,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds,
                card.ability.extra.total_rounds,
                card.ability.extra.multiplier
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds + 1

            if card.ability.extra.rounds == card.ability.extra.total_rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
        end

        if context.selling_self and card.ability.extra.rounds == card.ability.extra.total_rounds then
            if G.hand.highlighted then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.destroy_cards(G.hand.highlighted)
                        return true
                    end
                }))
                delay(0.3)
            end

            return {
                dollars = G.GAME.dollars * card.ability.extra.multiplier
            }
        end
    end
}