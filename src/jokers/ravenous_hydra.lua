SMODS.Joker {
    key = 'ravenous_hydra',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 15
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 10,
            hydras = 0,
            wildCards = {0, 0, 0, 0, 0}
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.hydras,
                card.ability.extra.wildCards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            --Each Hydra
            card.ability.extra.hydras = 0

            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if string.match(localize{type = 'name_text', set = 'Joker', key = joker.config.center.key}, 'Hydra') then
                    card.ability.extra.hydras = card.ability.extra.hydras + 1
                end
            end

            card.ability.extra.wildCards = {0, 0, 0, 0, 0}

            local adj = card.ability.extra.hydras
            local handCard = 0

            for i = 1, adj do
                if next(SMODS.get_enhancements(context.scoring_hand[i - handCard])) == 'm_wild' then
                    card.ability.extra.wildCards[i - handCard] = card.ability.extra.wildCards[i - handCard] + 1
                end

                if i >= #context.scoring_hand + handCard then
                    handCard = handCard + #context.scoring_hand
                end
            end
        end

        if context.individual and context.cardarea == G.play then
            local numerator = 0

            for i = 1, #context.scoring_hand do
                if context.other_card == context.scoring_hand[i] and next(SMODS.get_enhancements(context.other_card)) == 'm_wild' then
                    numerator = i
                    break
                end
            end

            if numerator > 0 then
                return {
                    chips = card.ability.extra.chips * card.ability.extra.wildCards[numerator]
                }
            end
        end

        if context.cardarea == G.hand and context.end_of_round and not context.game_over and not context.main_eval then
            if G.GAME.last_hand_played then
                for i = 1, #G.hand.cards do
                    if next(SMODS.get_enhancements(G.hand.cards[i])) == 'm_wild' then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if i - 1 >= 1 then
                                    G.hand.cards[i - 1]:set_ability('m_wild', nil, true)
                                    G.hand.cards[i - 1]:juice_up(0.3, 0.3)
                                end

                                if i + 1 <= #G.hand.cards then
                                    G.hand.cards[i + 1]:set_ability('m_wild', nil, true)
                                    G.hand.cards[i + 1]:juice_up(0.3, 0.3)
                                end
                                return {
                                    true
                                }
                            end
                        }))
                        return {
                            message = localize('k_infected'),
                            colour = G.C.GREEN
                        }
                    end
                end
            end
        end
    end
}