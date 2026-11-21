SMODS.Joker {
    key = 'guinsoos_rageblade',
    atlas = 'league_items_good',
    pos = {
        x = 33,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            stacks = 1,
            prevHand = nil,
            reqStacks = 4
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.stacks,
                card.ability.extra.prevHand,
                card.ability.extra.reqStacks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and card.ability.extra.prevHand == context.scoring_name and not context.blueprint then
            card.ability.extra.stacks = card.ability.extra.stacks + 1

            if card.ability.extra.stacks >= card.ability.extra.reqStacks then
                local text, _ = context.scoring_name
                return {
                    level_up = true,
                    level_up_hand = text
                }
            end
        elseif context.before and card.ability.extra.prevHand ~= context.scoring_name and not context.blueprint then
            card.ability.extra.stacks = 1
            card.ability.extra.prevHand = context.scoring_name
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.stacks = 1
            card.ability.extra.prevHand = nil
        end
    end
}