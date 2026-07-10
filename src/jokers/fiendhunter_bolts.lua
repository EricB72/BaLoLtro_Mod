SMODS.Joker {
    key = 'fiendhunter_bolts',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            critChance = 25,
            higherHand = '',
            currentCrit = 25,
            critDMG = 175,
            currentDMG = 175,
            totalCrit = 25,
            critLeader = true,
            xmultGain = 0.15,
            totalxMult = 1,
            
            -- Other items
            lord_dominiks = 0
 }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_fiendhunter_bolts')
        return {
            vars = {
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentCrit,
                card.ability.extra.currentDMG,
                numerator,
                denominator,
                card.ability.extra.totalCrit,
                card.ability.extra.critLeader,
                card.ability.extra.xmultGain,
                card.ability.extra.totalxMult,
                card.ability.extra.higherHand,
                
                -- Other items
                card.ability.extra.lord_dominiks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local play_more_than = (G.GAME.hands[context.scoring_name].level or 0)
            local highest = true

            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.level > play_more_than and SMODS.is_poker_hand_visible(handname) then
                    highest = false
                end
            end

            if highest then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'totalxMult',
                    scalar_value = 'xmultGain',
                    message_colour = G.C.RED
                    }
                )
            else
                card.ability.extra.totalxMult = 1
            end
        end
            
        if context.cardarea == G.play and context.individual and card.ability.extra.critLeader then            
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_fiendhunter_bolts', card.ability.extra.totalCrit, 100)
            local percentDmg = 1

            if crit then
                percentDmg = card.ability.extra.lord_dominiks * (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante)

                return { 
                    mult = (context.other_card.base.id + context.other_card.ability.perma_bonus) * (card.ability.extra.currentDMG / 100 - 1) * percentDmg,
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
        end
        --

        if context.joker_main then
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_fiendhunter_bolts', card.ability.extra.totalCrit, 100)
            local percentDmg = 1

            if crit then
                percentDmg = 1 + (card.ability.extra.lord_dominiks) * (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante) - 1 * card.ability.extra.lord_dominiks
                
                return {
                    xmult = card.ability.extra.totalxMult * (card.ability.extra.currentDMG / 100) * percentDmg,
                    message = localize('b_crit')
                }
            else
                return {
                    xmult = card.ability.extra.totalxMult
                }
            end
        end
    end,
    add_to_deck = function (self, card, context)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.critChance then
                if G.jokers.cards[i] ~= card then
                    if G.jokers.cards[i].ability.extra.critLeader then
                        card.ability.extra.critLeader = false
                    end

                    card.ability.extra.totalCrit = card.ability.extra.totalCrit + (G.jokers.cards[i].ability.extra.currentCrit or G.jokers.cards[i].ability.extra.critChance)
                    card.ability.extra.currentDMG = card.ability.extra.currentDMG + (G.jokers.cards[i].ability.extra.critDMGAugment or 0)
                    
                    G.jokers.cards[i].ability.extra.totalCrit = G.jokers.cards[i].ability.extra.totalCrit + card.ability.extra.currentCrit
                end
            end
        end
    end,
    remove_from_deck = function(self, card, context)
        local jokers = {}

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] and G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.critChance and G.jokers.cards[i] ~= card then
                jokers[#jokers + 1] = G.jokers.cards[i]
            end
        end

        for i = 1, #jokers do            
            jokers[i].ability.extra.totalCrit = jokers[i].ability.extra.totalCrit - card.ability.extra.currentCrit

            if i == #jokers then jokers[i].ability.extra.critLeader = true end
        end
    end
}