SMODS.Joker {
    key = 'sg',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 0,
            mult = 0,
            percentage = 45,
            minHands = 2,
            hands = 1,
            cooldown = 2,
            scalar = 1,
            rounds = 2,
            reset = 0
        }
    },
    rarity = 1,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.percentage,
                card.ability.extra.minHands,
                card.ability.extra.hands,
                card.ability.extra.cooldown,
                card.ability.extra.rounds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.modify_hand then
            local chips, mult = SMODS.get_scoring_parameter('chips', flames) * card.ability.extra.percentage / 100,
                                SMODS.get_scoring_parameter('mult', flames) * card.ability.extra.percentage / 100

            SMODS.Scoring_Parameters['chips']:modify(chips)
            SMODS.Scoring_Parameters['mult']:modify(mult)
            G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                return {
                    message = tostring('+' .. card.ability.extra.percentage .. '%')
                }
        end

        if context.hand_drawn and G.GAME.current_round.hands_left < card.ability.extra.minHands and card.ability.extra.cooldown >= card.ability.extra.rounds and card.ability.extra.cooldown ~= card.ability.extra.reset then
            card.ability.extra.cooldown = card.ability.extra.reset
            ease_hands_played(card.ability.extra.hands)
            return {
                message = tostring('+' .. card.ability.extra.hands .. ' ' .. localize('a_hand'))
            }
        end

        if context.ending_shop then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'cooldown',
                scalar_value = 'scalar',
            })

            if card.ability.extra.cooldown >= card.ability.extra.rounds then
                return {
                message = localize('a_active')
            }
            end
        end
    end
}