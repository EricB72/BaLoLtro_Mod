SMODS.Joker {
    key = 'serpents_fang',
    atlas = 'league_items_good',
    pos = {
        x = 25,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            originalBlind = 0,
            currentPercent = 0,
            reqPercent = 30
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.originalBlind,
                card.ability.extra.currentPercent,
                card.ability.extra.reqPercent
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
            card.ability.extra.currentPercent = 0
        end

    
        if (context.before or context.hand_drawn or context.after) and not context.blueprint then
            card.ability.extra.currentPercent = tonumber(tostring((1 - (G.GAME.blind.chips / card.ability.extra.originalBlind)) * 100))
        end

        if (context.before or context.hand_drawn) and card.ability.extra.currentPercent >= card.ability.extra.reqPercent and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end
}