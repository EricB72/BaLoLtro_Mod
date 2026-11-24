SMODS.Joker {
    key = 'spirit_visage',
    atlas = 'league_items_good',
    pos = {
        x = 31,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            denominator = 10,
            gainExtra = 1
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.denominator, 'tstmod_spirit_visage')
        return {
            vars = {
                card.ability.extra.denominator,
                card.ability.extra.gainExtra,
                num,
                den
            }
        }
    end,
    calculate = function(self, card, context)
        if context.tstmod_hand_gained and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'tstmod_spirit_visage', 1, card.ability.extra.denominator, 'tstmod_spirit_visage') then
                ease_hands_played(card.ability.extra.gainExtra)
                return{
                    message = localize('k_lucky'),
                    message_colour = G.C.BLUE
                }
            end
        end

        if context.tstmod_discard_gained and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'tstmod_spirit_visage', 1, card.ability.extra.denominator, 'tstmod_spirit_visage') then
                ease_discard(card.ability.extra.gainExtra)
                return{
                    message = localize('k_lucky'),
                    message_colour = G.C.RED
                }
            end
        end
    end
}