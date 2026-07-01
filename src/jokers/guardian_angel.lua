SMODS.Joker {
    key = 'guardian_angel',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mod_conv = 'm_glass',
            percentage = 50
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mod_conv,
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            for i = 1, math.floor(#G.playing_cards * card.ability.extra.percentage / 100) do
                G.playing_cards[i]:set_ability(card.ability.extra.mod_conv)
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    SMODS.destroy_cards(card, nil, true)
                    return true
                end
            }))
            return {
                message = localize('k_saved_ex'),
                saved = 'Saved by Guardian Angel',
                colour = G.C.ORANGE
            }
        end
    end
}