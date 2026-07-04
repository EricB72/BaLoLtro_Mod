SMODS.Joker {
    key = 'iceborn_gauntlet',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 25,
            dollars = 5,
            numerator = 1,
            denominator = 10,
            highCard = 'High Card',
            prevHand = 'None',
            spellblade = true,
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'j_tstmod_iceborn_gauntlet')
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.dollars,
                card.ability.extra.numerator,
                card.ability.extra.denominator,
                numerator,
                denominator,
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.spellblade
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard and not context.blueprint then
            local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'j_tstmod_iceborn_gauntlet')
            local trigger = SMODS.pseudorandom_probability(card, 'j_tstmod_iceborn_gauntlet', numerator, denominator)

            card.ability.extra.prevHand = context.scoring_name

            if trigger then
                if G.GAME.blind.boss then
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                delay(0.4)
                                return true
                            end
                        }))
                        SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                        return {
                            true
                    }
                    end
                    }))
                    return {
                            chips = card.ability.extra.chips,
                            dollars = card.ability.extra.dollars,
                            nil, true -- This is for Joker retrigger purposes
                    }
                end
                return {
                        chips = card.ability.extra.chips,
                        dollars = card.ability.extra.dollars
                }
            end
        elseif context.joker_main and not context.blueprint then
            card.ability.extra.prevHand = context.scoring_name
        end
    end
}