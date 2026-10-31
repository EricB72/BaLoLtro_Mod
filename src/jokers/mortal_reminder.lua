SMODS.Joker {
    key = 'mortal_reminder',
    atlas = 'league_items_good',
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            costRed = 1
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.costRed
            }
        }
    end,
    calculate = function(self, card, context)
       if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) - card.ability.extra.costRed
                        other_card:set_cost()
                        card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.costRed
                        card:set_cost()
                    end
                end
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}