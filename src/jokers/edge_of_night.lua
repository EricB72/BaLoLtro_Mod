SMODS.Joker {
    key = 'edge_of_night',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 0,
            multGain = 3,
            nominatorMult = 3,
            nominatorDecrease = 10
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.multGain,
                card.ability.extra.nominatorMult,
                card.ability.extra.nominatorDecrease
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local numGlass = 0
            for _, glassCard in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(glassCard, 'm_glass') then numGlass = numGlass + 1 end
            end

            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multGain * numGlass
        end

         if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.mult = 0
                card.ability.extra.nominatorMult = card.ability.extra.nominatorMult * (100 - card.ability.extra.nominatorDecrease * glass_cards) / 100
                return true
            end
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
            -- Glass Joker updates on Hanged Man and no other destroy consumable
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.mult = 0
                return true
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * card.ability.extra.nominatorMult
            }
        end
    end
}