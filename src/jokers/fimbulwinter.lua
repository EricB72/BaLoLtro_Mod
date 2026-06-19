SMODS.Joker {
    key = 'fimbulwinter',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 22
    },
    config = {
        extra = {
            chips = 0,
            mult = 0,
            HandNum = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.HandNum
            }
        }
    end,
    calculate = function(self, card, context)
        
    end
}