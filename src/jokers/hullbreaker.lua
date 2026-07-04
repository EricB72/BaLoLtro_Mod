SMODS.Joker {
    key = 'hullbreaker',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 50,
            xmult = 1,
            hands = 2,
            percent = 10
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.hands,
                card.ability.extra.percent
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.hands_played ~= 0 and G.GAME.current_round.hands_played % card.ability.extra.hands == 0 then
                card.ability.extra.xmult = 1 + math.fmod((G.GAME.dollars or 0) / card.ability.extra.percent, 2)

                if G.GAME.blind.boss then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                else
                    return {
                        mult = card.ability.extra.mult
                    }
                end
                
            end
        end
    end
}