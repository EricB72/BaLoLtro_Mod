SMODS.Joker {
    key = 'bastionbreaker',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            xmulUpg = 3,
            active = false,
            skips = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmulUpg,
                card.ability.extra.active,
                card.ability.extra.skips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.active then
                return {
                    xmult = card.ability.extra.xmulUpg * #G.jokers.cards
                }
            else
                return {
                    xmult = card.ability.extra.xmult * #G.jokers.cards
                }
            end
        end

        if context.skip_blind and not context.blueprint then
            card.ability.extra.skips = card.ability.extra.skips + 1
        end

        if context.setting_blind and not context.blueprint and context.blind.boss then
            if card.ability.extra.skips >= 2 then
                card.ability.extra.active = true
                card.ability.extra.skips = 0
            end
        end
    end
}