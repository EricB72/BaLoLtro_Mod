SMODS.Joker {
    key = 'am',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 1
    },
    config = {
        extra = {
            chips = 1.2
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played ~= 0 then
            return {
                xchips = card.ability.extra.chips
            }
        end
    end
}