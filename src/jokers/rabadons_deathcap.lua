SMODS.Joker {
    key = 'rdc',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            highCard = 'High Card',
            percentage = 1.3
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name ~= card.ability.extra.highCard then
            return {
                xchips = 1.3,
                xmult = 1.3
            }
        end
    end
}