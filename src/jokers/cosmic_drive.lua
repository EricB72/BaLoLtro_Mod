SMODS.Joker {
    key = 'cosmic_drive',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percent = 10,
            chips = 40,
            currentPercent = 0,
            originalBlind = 0,
            currModule = 0,
            currentBlind = 0,
            prevModule = 0,
            tags = {'tag_uncommon', 'tag_rare', 'tag_double', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome', 'tag_investment', 'tag_voucher', 'tag_boss', 'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon', 'tag_handy', 'tag_garbage', 'tag_ethereal', 'tag_coupon', 'tag_juggle', 'tag_d_six', 'tag_top_up', 'tag_skip', 'tag_orbital', 'tag_economy'},
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.chips,
                card.ability.extra.currentPercent,
                card.ability.extra.originalBlind,
                card.ability.extra.tags,
                card.ability.extra.currModule,
                card.ability.extra.prevModule
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

    
        if context.after then
            card.ability.extra.currentPercent = tonumber(tostring((1 - (G.GAME.blind.chips / card.ability.extra.originalBlind)) * 100))
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then            
            card.ability.extra.currModule = (card.ability.extra.currentPercent - card.ability.extra.currentPercent % card.ability.extra.percent) / 10

            for i = 1, card.ability.extra.currModule do
                add_tag({ key = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))] })
            end

            card.ability.extra.currentPercent = 0
            card.ability.extra.currModule = 0
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
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
                { ref_table = "card.ability.extra", ref_value = "currentPercent"},
                { text = "%)" },
                { scale = 0.3 }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                
            end
        }
    end
}