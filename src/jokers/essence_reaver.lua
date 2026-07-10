SMODS.Joker {
    key = 'essence_reaver',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 25,
            highCard = 'High Card',
            prevHand = 'None',
            spellblade = true,
            critChance = 25,
            currentCrit = 25,
            critDMG = 175,
            currentDMG = 175,
            totalCrit = 25,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            critLeader = true,

            -- Other items
            lord_dominiks = 0
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_essence_reaver')
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.spellblade,
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentCrit,
                card.ability.extra.currentDMG,
                numerator,
                denominator,
                card.ability.extra.totalCrit,
                card.ability.extra.mod_conv,
                card.ability.extra.critLeader,

                -- Other items
                card.ability.extra.lord_dominiks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and card.ability.extra.critLeader then            
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_essence_reaver', card.ability.extra.totalCrit, 100)
            local percentDmg = 1

            if crit then
                percentDmg = 1 + (card.ability.extra.lord_dominiks) * (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante) - 1 * card.ability.extra.lord_dominiks

                return { 
                    mult = (context.other_card.base.id + context.other_card.ability.perma_bonus) * (card.ability.extra.currentDMG / 100 - 1) * percentDmg,
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
        end

        if context.before and card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard and not context.blueprint then
            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i].debuff and not next(SMODS.get_enhancements(context.scoring_hand[i])) then
                    context.scoring_hand[i]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))], nil, false)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[i]:juice_up()
                            return {
                                true
                            }
                        end
                    }))
                end
            end

            return {
                message = localize('k_enhanced')
            }

        end

        -- Spellblade
        if context.joker_main then
            if card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard then
                card.ability.extra.prevHand = context.scoring_name
                card.ability.extra.mult = card.ability.extra.totalCrit

                return {
                    mult = card.ability.extra.mult
                }
            else
                card.ability.extra.prevHand = context.scoring_name
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