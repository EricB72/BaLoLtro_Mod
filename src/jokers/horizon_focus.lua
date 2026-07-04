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
            forEach = 0.25,
            stored = false,
            extraAmount = 2
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.forEach,
                card.ability.extra.stored,
                card.ability.extra.extraAmount
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round and not context.blueprint then
            local left = context.scoring_hand[1].base.id
            local right = context.scoring_hand[#context.scoring_hand].base.id

            card.ability.extra.xchips = (left - right) * card.ability.extra.forEach

            if card.ability.extra.xchips < 1 then card.ability.extra.xchips = 1 end
        end

        if context.joker_main then
            if card.ability.extra.stored then
                return {
                    xchips = card.ability.extra.xchips * card.ability.extra.extraAmount
                }
            else
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end

        if context.hand_drawn and not context.blueprint then
            if card.ability.extra.xchips >= 2 and not card.ability.extra.stored then
                card.ability.extra.stored = true
            elseif card.ability.extra.xchips < 2 then
                card.ability.extra.stored = false
            end
        end

        if context.end_of_round and not context.blueprint then
           card.ability.extra.stored = false
           card.ability.extra.xchips = 1
        end
    end
}