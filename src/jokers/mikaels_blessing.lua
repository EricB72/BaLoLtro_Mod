SMODS.Joker {
    key = 'mikaels_blessing',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 12
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            dollars = 0
        }
    },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].debuff and not G.hand.cards[i].ability.debuff then
                    local _card = G.hand.cards[i]
                    if not _card.debuff then
                        card.ability.extra.dollars = card.ability.extra.dollars + 1
                    end
                end
            end
            if G.GAME.blind then
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if not G.hand.cards[i].debuff then
                            G.hand.cards[i].ability.perma_debuff = true
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.cards do
                local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
            return {
                dollars = card.ability.extra.dollars,
                message = localize('k_debuffed')
            }
            end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = 'card.joker_display_values',
                ref_value = 'debuff'
            },
            text = {
                { text = "$", colour = G.C.GOLD },
                { ref_table = "card.joker_display_values", ref_value = "debuff", retrigger_type = "mult", colour = G.C.GOLD },
                { scale = 0.4 }
            },
            calc_function = function(card)
                local debuffedCards = 0

                for i = 1, #G.hand.cards do
                    if not G.hand.cards[i].debuff then
                        debuffedCards = debuffedCards + 1
                    end
                end

                card.joker_display_values.debuff = debuffedCards
            end
        }
    end
}