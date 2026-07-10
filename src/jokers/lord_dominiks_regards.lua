SMODS.Joker {
    key = 'lord_dominiks_regards',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 11
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            critChance = 25,
            critDMG = 175,
            currentDMG = 175,
            totalCrit = 25,
            critLeader = true,
            critIncrease = 1
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_lord_dominiks_regards')
        return {
            vars = {
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentDMG,
                numerator,
                denominator,
                card.ability.extra.totalCrit,
                card.ability.extra.critLeader,
                card.ability.extra.critIncrease
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and card.ability.extra.critLeader then
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_lord_dominiks_regards', card.ability.extra.totalCrit, 100)
            local percentDmg = 1

            if crit then
                percentDmg = card.ability.extra.critIncrease * (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante)

                return { 
                    mult = (context.other_card.base.id + context.other_card.ability.perma_bonus) * (card.ability.extra.currentDMG / 100 - 1) * percentDmg,
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
        end
    end,
    add_to_deck = function (self, card, context)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra then
                if G.jokers.cards[i] ~= card then
                    if G.jokers.cards[i].ability.extra.critChance then
                        if G.jokers.cards[i].ability.extra.critLeader then
                            card.ability.extra.critLeader = false
                        end

                        card.ability.extra.totalCrit = card.ability.extra.totalCrit + (G.jokers.cards[i].ability.extra.currentCrit or G.jokers.cards[i].ability.extra.critChance)
                        card.ability.extra.currentDMG = card.ability.extra.currentDMG + (G.jokers.cards[i].ability.extra.critDMGAugment or 0)   
                        
                        G.jokers.cards[i].ability.extra.totalCrit = G.jokers.cards[i].ability.extra.totalCrit + card.ability.extra.critChance
                    end

                    if G.jokers.cards[i].ability.extra.critDMG then
                        G.jokers.cards[i].ability.extra.lord_dominiks = card.ability.extra.critIncrease
                    end
                end
            end
        end
    end,
    remove_from_deck = function(self, card, context)
        local jokers = {}

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] and G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i] ~= card then
                jokers[#jokers + 1] = G.jokers.cards[i]
            end
        end

        for i = 1, #jokers do
            if G.jokers.cards[i].ability.extra.critChance then
                jokers[i].ability.extra.totalCrit = jokers[i].ability.extra.totalCrit - card.ability.extra.critChance

                if i == #jokers then jokers[i].ability.extra.critLeader = true end
            end
            
            if jokers[i].ability.extra.critDMG then
                jokers[i].ability.extra.lord_dominiks = 0
            end
        end
    end
}