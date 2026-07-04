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
        if context.before or context.modify_hand then
            card.ability.extra.chips = math.max(hand_chips * card.ability.extra.percentage / 100)
            card.ability.extra.mult = math.max(mult * card.ability.extra.percentage / 100)
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end

        if context.hand_drawn and G.GAME.current_round.hands_left < card.ability.extra.minHands and card.ability.extra.cooldown >= card.ability.extra.rounds then
            card.ability.extra.cooldown = card.ability.extra.reset
            ease_hands_played(card.ability.extra.hands)
            return {
                message = localize('a_hands')
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
                message = localize('k_active')
            }
            end
        end
    end
}