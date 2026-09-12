SMODS.Joker {
    key = 'phantom_dancer',
    atlas = 'uncommon_league_items',
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {

        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {

            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            G.shop = true
        end

        if context.joker_main then
            return {
                message = 'NOPE!'
            }
        end
    end
}