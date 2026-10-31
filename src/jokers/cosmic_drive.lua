SMODS.Joker {
    key = 'cosmic_drive',
    atlas = 'league_items_good',
    pos = {
        x = 15,
        y = 0
    },
    display_size = {
        w = 68,
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
            tags = 0,
            nextTag = 'IDK'
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.chips,
                card.ability.extra.currentPercent,
                card.ability.extra.originalBlind,
                card.ability.extra.tags,
                card.ability.extra.currModule,
                card.ability.extra.prevModule,
                card.ability.extra.nextTag
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

    
        if context.after and not context.blueprint then
            card.ability.extra.currentPercent = tonumber(tostring((1 - (G.GAME.blind.chips / card.ability.extra.originalBlind)) * 100))
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then            
            card.ability.extra.currModule = (card.ability.extra.currentPercent - card.ability.extra.currentPercent % card.ability.extra.percent) / 10

            for i = 1, card.ability.extra.currModule do
                add_tag(card.ability.extra.tags)

                card.ability.extra.tags = get_next_tag_key()
                card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.tags }

                card.ability.extra.tags = Tag(card.ability.extra.tags)
            end

            card.ability.extra.currentPercent = 0
            card.ability.extra.currModule = 0
        end
    end,
    add_to_deck = function (self, card, context)
        card.ability.extra.tags = get_next_tag_key()
        card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.tags }

        card.ability.extra.tags = Tag(card.ability.extra.tags)
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