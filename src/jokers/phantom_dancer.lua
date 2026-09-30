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
            xmult = 0,
            xmultGain = 1
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind or context.type == 'new_blind_choice' then
            local lock = card.ID
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultGain
            G.CONTROLLER.locks[lock] = true
            G.from_boss_tag = true
            G.FUNCS.reroll_boss()

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.CONTROLLER.locks[lock] = nil
                            return true
                        end
                    }))
                    return true
                end
            }))

            return true
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}