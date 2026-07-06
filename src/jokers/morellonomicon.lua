SMODS.Joker {
    key = 'morellonomicon',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 13
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 0,
            mult = 0,
            HandNum = 0
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.HandNum
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and (context.other_card.gold_seal ~= nil or context.other_card.seal ~= nil) then
            if context.other_card.seal == 'Blue' then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            local _planet = nil
                            for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                                if planet_center.config.hand_type == G.GAME.last_hand_played then
                                    _planet = planet_center.key
                                end
                            end
                            if _planet then
                                SMODS.add_card({ key = _planet })
                            end
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
                end
            end

            if context.other_card.seal == 'Gold' then
                return {
                    dollars = 3
                }
            end

            if context.other_card.seal == 'Purple' then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            SMODS.add_card({ set = 'Tarot' })
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
                end
            end
        end
    end
}