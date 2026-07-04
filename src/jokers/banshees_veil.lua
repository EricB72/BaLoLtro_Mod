SMODS.Joker {
    key = 'banshees_veil',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 50,
            cooldown = 2,
            handNum = 1,
            currentCooldown = 0,
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.cooldown,
                card.ability.extra.handNum,
                card.ability.extra.currentCooldown
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.setting_blind and not context.blueprint and context.blind.boss and card.ability.extra.currentCooldown <= 0 then
            card.ability.extra.currentCooldown = card.ability.extra.cooldown + 1
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
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = ""
            },
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra", ref_value = "cooldown"},
                { text = ")" },
                { scale = 0.3 }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                
            end
        }
    end
}