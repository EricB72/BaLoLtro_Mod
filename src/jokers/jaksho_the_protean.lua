SMODS.Joker {
    key = 'jaksho_the_protean',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xchips = 1.3,
            xmult = 1.3,
            multiplier = 1.3,
            disabled = false
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xmult,
                card.ability.extra.disabled,
                card.ability.extra.multiplier
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult
            }
        end

        if G.GAME.blind.disabled and not card.ability.extra.disabled and not context.blueprint then
            card.ability.extra.disabled = true
            card.ability.extra.xchips = card.ability.extra.xchips * card.ability.extra.multiplier
            card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.multiplier
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.disabled = false
        end
    end
}