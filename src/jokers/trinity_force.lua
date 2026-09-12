SMODS.Joker {
    key = 'tf',
    atlas = 'rare_league_items',
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            dollars = 3.33,
            chipsMult = 3.33,
            multMult = 3.33,
            highCard = 'High Card',
            prevHand = 'None',
            spellblade = true,
            repetitions = 0
        }
    },
    rarity = 3,
    cost = 9.99,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.chipsMult,
                card.ability.extra.multMult,
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.spellblade,
                card.ability.extra.repetitions
            }
        }
    end,
    calculate = function(self, card, context)
        --Spellblade
        if context.individual and context.cardarea == G.play and card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard then                
            if context.other_card:get_id() and context.other_card:get_id() == 3 then
                return {
                    xchips = card.ability.extra.chipsMult,
                    xmult = card.ability.extra.multMult,
                    dollars = card.ability.extra.dollars
                }
            end
        end

        if context.after and not context.blueprint then
            card.ability.extra.prevHand = context.scoring_name
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_spellblade'), G.C.ORANGE, G.C.WHITE, 1.2 )
    end
}