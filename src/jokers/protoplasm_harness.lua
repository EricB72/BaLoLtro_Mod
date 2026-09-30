SMODS.Joker {
    key = 'protoplasm_harness',
    atlas = 'uncommon_league_items',
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
            percent = 50,
            requiredHands = 1,
            requiredDiscards = 0,
            discards = 1,
            dollars = 5,
            handSize = 2,
            triggered = 0
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.requiredHands,
                card.ability.extra.requiredDiscards,
                card.ability.extra.discards,
                card.ability.extra.dollars,
                card.ability.extra.handSize,
                card.ability.extra.triggered
            }
        }
    end,
    calculate = function(self, card, context)
        if (not context.end_of_round) then
            if context.joker_main and G.GAME.chips / G.GAME.blind.chips * 100 <= card.ability.extra.percent and G.GAME.current_round.hands_left == card.ability.extra.requiredHands and G.GAME.current_round.discards_left <= card.ability.extra.requiredDiscards and not context.blueprint then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                
                G.GAME.blind:disable()
                                            
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                ease_discard(card.ability.extra.discards, nil, true)
                                G.hand:change_size(card.ability.extra.handSize)
                                delay(0.4)
                                return {
                                    true
                                }
                            end
                        }))
                        return true
                    end
                }))
                return {
                    dollars = card.ability.extra.dollars, 
                    nil, true -- This is for Joker retrigger purposes
                }
            end
        end

        if context.setting_blind and not context.game_over then
            G.hand:change_size(-card.ability.extra.triggered * card.ability.extra.handSize)
            card.ability.extra.triggered = 0
        end
    end
}