SMODS.Joker {
    key = 'dad',
    atlas = 'uncommon_league_items',
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            highCard = 'High Card',
            prevHand = 'None',
            triggered = false,
            retrigger = 1
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.triggered,
                card.ability.extra.retrigger
            }
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and card.ability.extra.prevHand ~= card.ability.extra.highCard and card.ability.extra.highCard == context.scoring_name then
            return {
                repetitions = card.ability.extra.retrigger * #context.scoring_hand
            }
        end

        if context.after and not context.blueprint then
            card.ability.extra.prevHand = context.scoring_name
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_spellblade'), G.C.ORANGE, G.C.WHITE, 1.2 )
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            
        }
    end
}