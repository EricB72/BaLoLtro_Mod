SMODS.Joker {
    key = 'dead_mans_plate',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            freeRerolls = 1,
            mult = 0,
            multGain = 5,
            skipGain = 20,
            reset = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.freeRerolls,
                card.ability.extra.mult,
                card.ability.extra.multGain,
                card.ability.extra.skipGain,
                card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'multGain',
                    message_colour = G.C.GREEN
                    }
                )
        end

        if context.skip_blind and not context.blueprint then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'skipGain',
                    }
                )
        end
        
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.end_of_round and G.GAME.blind.boss then
            --[[SMODS.reset_value(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'reset'
                    }
                )--]]
            card.ability.extra.mult = 0
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.freeRerolls)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.freeRerolls)
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
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
                { scale = 0.4 }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                
            end
        }
    end
}