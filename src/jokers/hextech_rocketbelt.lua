SMODS.Joker {
    key = 'hextech_rocketbelt',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 8
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 0,
            chipGain = 5,
            xchips = 1,
            xchipsGain = 0.25,
            skipCounter = 0
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.xchips,
                card.ability.extra.xchipsGain,
                card.ability.extra.skipCounter
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain

            if G.GAME.skips % 2 == 0 then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsGain
            end
            
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                xchips = 1 + card.ability.extra.xchips
            }
        end
    end
}