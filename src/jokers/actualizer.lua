SMODS.Joker {
    key = 'act',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            hands = -1,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            mod_seals = {'Purple', 'Blue', 'Red', 'Gold'}
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.mod_conv,
                card.ability.extra.mod_seals
        }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
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
                            local _card = G.hand.cards[i]
                            if not next(SMODS.get_enhancements(_card)) then
                                _card:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])           
                            end
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if not G.hand.highlighted[i].debuff then
                            local _card = G.hand.highlighted[i]
                            _card:set_seal(card.ability.extra.mod_seals[math.floor(math.random(1, #card.ability.extra.mod_seals))], nil, true)
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
                message = localize('k_enhanced')
            }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
    end
}