SMODS.Joker {
    key = 'mercurial_scimitar',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 12
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            handSize = 0
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.handSize
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.handSize = 0

            for i = 1, #G.play.cards do
                if G.play.cards[i].debuff then
                    card.ability.extra.handSize = card.ability.extra.handSize + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.play.cards[i].debuff = false
                            G.play.cards[i]:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
            end
        end

        if context.after then
            G.hand:change_size(card.ability.extra.handSize)
        end

        if context.hand_drawn then
            G.hand:change_size(-card.ability.extra.handSize)
            card.ability.extra.handSize = 0
        end

        if context.end_of_round and not context.blueprint then
            card.ability.extra.handSize = 0
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = 'card.joker_display_values',
                ref_value = 'handSize'
            },
            text = {
                { text = "+", colour = G.C.GOLD },
                { ref_table = "card.joker_display_values", ref_value = "handSize", retrigger_type = "mult", colour = G.C.GOLD },
                { scale = 0.4 }
            },
            calc_function = function(card)
                local debuffedCards = 0

                for i = 1, #G.hand.highlighted do
                    if G.hand.highlighted[i].debuff then
                        debuffedCards = debuffedCards + 1
                    end
                end

                card.joker_display_values.handSize = debuffedCards
            end
        }
    end
}