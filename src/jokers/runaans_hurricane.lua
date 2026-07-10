SMODS.Joker {
    key = 'runaans_hurricane',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 16
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            cards = 2
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.cards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            local suits = {'Spades', 'Hearts', 'Diamonds', 'Clubs'}

            G.E_MANAGER:add_event(Event({
            func = function()
                local _first_dissolve = nil
                local new_cards = {}
                for i = 1, card.ability.extra.cards do
                    local id = math.random(2, 14)
                    local suit = suits[math.random(1, 4)]
                    local rank = tostring(id)

                    if rank == '14' then rank = 'Ace' end
                    if rank == '13' then rank = 'King' end
                    if rank == '12' then rank = 'Queen' end
                    if rank == '11' then rank = 'Jack' end

                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1

                    local _card = SMODS.add_card { set = "Base", enhancement = next(SMODS.get_enhancements(context.full_hand[1])), seal = context.full_hand[1].seal, key_append = "runaans_hurricane" }

                    _card:set_edition(context.full_hand[1].edition, true)

                    G.GAME.blind:debuff_card(_card)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                return true
            end}))
        end
    end
}