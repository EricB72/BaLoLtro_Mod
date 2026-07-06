SMODS.Joker {
    key = 'horizon_focus',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xchips = 1,
            forEach = 0.25
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.forEach
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.end_of_round and not context.blueprint then
            local left = context.scoring_hand[1].base.id
            local right = context.scoring_hand[#context.scoring_hand].base.id

            card.ability.extra.xchips = (left - right) * card.ability.extra.forEach

            if card.ability.extra.xchips < 1 then card.ability.extra.xchips = 1 end
        end

        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end

        if context.end_of_round and not context.blueprint then
           card.ability.extra.xchips = 1
        end
    end
}