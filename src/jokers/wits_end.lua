SMODS.Joker {
    key = 'wits_end',
    atlas = 'league_items_good',
    pos = {
        x = 53,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            mult = 5,
            xmult = 2
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker then
            if context.other_joker:is_rarity("Uncommon") then
                return {
                    mult = card.ability.extra.mult
                }
            elseif context.other_joker:is_rarity("Rare") then 
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}