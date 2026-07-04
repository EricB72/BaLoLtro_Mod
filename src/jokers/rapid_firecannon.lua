SMODS.Joker {
    key = 'rapid_firecannon',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 15
    },
    display_size = {
        w = 69,
        h = 68
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
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
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