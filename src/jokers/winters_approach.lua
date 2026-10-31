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
    rarity = 3,
    cost = 6,
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

        if (context.end_of_round or context.hand_drawn) and not context.blueprint then
            if card.ability.extra.goldNum <= 0 then
                SMODS.add_card {
                    key = card.ability.extra.fimbulwinter,
                }
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end
}