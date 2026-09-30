SMODS.Joker {
    key = 'banshees_veil',
    atlas = 'league_items_good',
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            cooldown = 2,
            handNum = 1,
            currentCooldown = 2,
            juiced = false
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cooldown,
                card.ability.extra.handNum,
                card.ability.extra.currentCooldown,
                card.ability.extra.juiced
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and context.blind.boss and card.ability.extra.currentCooldown <= 0 then
            card.ability.extra.currentCooldown = card.ability.extra.cooldown + 1
            card.ability.extra.juiced = false
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

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.current_round.hands_left <= card.ability.extra.handNum then
                card.ability.extra.currentCooldown = card.ability.extra.cooldown
            elseif card.ability.extra.currentCooldown > 0 then 
                card.ability.extra.currentCooldown = card.ability.extra.currentCooldown - 1
            end

            if card.ability.extra.currentCooldown <= 0 and not card.ability.extra.juiced then
                local eval = function() return card.ability.extra.currentCooldown <= 0 end

                juice_card_until(card, eval, false)
                card.ability.extra.juiced = true
            end
        end
    end
}