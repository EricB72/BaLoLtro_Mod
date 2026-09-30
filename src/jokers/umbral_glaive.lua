SMODS.Joker {
    key = 'umbral_glaive',
    atlas = 'league_items_good',
    pos = {
        x = 46,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            denominator = 10,
            flush = true
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 10, 'umbral_glaive')
        return {
            vars = {
                numerator,
                card.ability.extra.denominator,
                card.ability.extra.flush
            }
        }
    end,
    calculate = function(self, card, context)
        if context.stay_flipped and context.to_area == G.hand and
            SMODS.pseudorandom_probability(blind, 'umbral_glaive', 1, card.ability.extra.denominator) then
            return {
                stay_flipped = true
            }
        end

        if context.stay_flipped and context.to_area == G.play and
            context.other_card.facing == 'back' then
            return {
                stay_flipped = true
            }
        end

        if context.modify_scoring_hand and not context.blueprint then
            card.ability.extra.flush = true

            for i = 1, (#context.full_hand) do
                if context.full_hand[i].facing ~= nil and context.full_hand[i].facing ~= 'back' and context.playing_cards == nil then
                    card.ability.extra.flush = false
                end
            end

            if card.ability.extra.flush then
                return {
                    add_to_hand = true
                }
            end
        end

        if context.selling_self and not context.blueprint then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].facing == 'back' then
                    G.hand.cards[i]:flip()
                end
            end
            for _, playing_card in pairs(G.playing_cards) do
                playing_card.ability.wheel_flipped = nil
            end
        end
    end
}