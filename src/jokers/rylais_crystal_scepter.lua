SMODS.Joker {
    key = 'rylais_crystal_scepter',
    atlas = 'league_items_good',
    pos = {
        x = 23,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            xmult = 0.3
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult + card.ability.extra.xmult * G.GAME.current_round.hands_played
            }
        end
    end
}