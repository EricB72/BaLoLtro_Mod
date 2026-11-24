SMODS.Joker {
    key = 'winters_approach',
    atlas = 'league_items_good',
    pos = {
        x = 52,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            goldNum = 3,
            fimbulwinter = "j_tstmod_fimbulwinter",
            goldEnh = 'm_gold'
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.goldNum,
                card.ability.extra.fimbulwinter,
                card.ability.extra.goldEnh
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            local cards_To_Enh = card.ability.extra.goldNum
            card.ability.extra.goldNum = card.ability.extra.goldNum - 1

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = #G.hand.cards, 1, -1 do
                G.E_MANAGER:add_event(Event({
                        func = function()
                            local _card = G.hand.cards[i]

                            if not next(SMODS.get_enhancements(_card)) and cards_To_Enh > 0 and not _card.debuff then
                                _card:set_ability(card.ability.extra.goldEnh)
                                _card:juice_up(0.3, 0.3)
                                cards_To_Enh = cards_To_Enh - 1
                            end
                            return true
                        end
                    }))
            end
        end

        if ((context.end_of_round and not context.game_over and context.main_eval) or context.hand_drawn) and not context.blueprint and card.ability.extra.goldNum <= 0 then
            local cost       = card.cost
            local sell_cost  = card.sell_cost
            local base_cost  = card.base_cost
            local extra_val  = card.ability.extra_value

            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.2,
                func = function()
                    card:set_ability(G.P_CENTERS['j_tstmod_fimbulwinter'])

                    -- Restaurar precio y valor de venta (igual que antes)
                    card.base_cost = base_cost
                    card.cost = cost
                    card.sell_cost = sell_cost
                    card.ability.extra_value = extra_val

                    -- Animación de aparecer, con los colores de la "disolución"
                    card:start_materialize({ G.C.WHITE, HEX('d3af37') })
                    card:juice_up(0.6, 0.6)
                    return true
                end
            }))
            return {message = "Transformed"}
        end
    end
}