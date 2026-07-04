SMODS.Joker {
    key = 'hubris',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 0,
            multGain = 6
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.multGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multGain

            if G.GAME.blind.boss then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multGain
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.skip_blind and not context.blueprint then
            card.ability.extra.mult = 0
        end
    end
}