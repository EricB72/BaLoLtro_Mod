SMODS.Joker {
    key = 'kaenic_rookern',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            dollars = 2
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
    calculate = function(self, card, context)
        
    end,
    calc_dollar_bonus = function(self, card)
        local prevDollars = card.ability.extra.dollars * G.GAME.current_round.hands_left

        return true and prevDollars or nil
    end
}