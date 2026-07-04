SMODS.Joker {
    key = 'infinity_edge',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            critChance = 25,
            currentCrit = 25,
            critDMG = 175,
            currentDMG = 175,
            critDMGAugment = 30,
            critLeader = true,
            totalCrit = 25
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_infinity_edge')
        return {
            vars = {
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentCrit,
                card.ability.extra.critDMGAugment,
                card.ability.extra.critLeader,
                card.ability.extra.currentDMG,
                numerator,
                denominator,
                card.ability.extra.totalCrit
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            local jokers = {}

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.extra.critDMG and G.jokers.cards[i].ability.extra.critDMG >= 0 then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end

            -- Only IE
            for i = 1, #jokers do
                jokers[i].ability.extra.currentDMG = jokers[i].ability.extra.critDMG + card.ability.extra.critDMGAugment
            end
        end
        
        if context.after and card.ability.extra.critLeader then
            local jokers = {}
            local totalCrit = 0

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.extra.currentCrit and G.jokers.cards[i].ability.extra.currentCrit >= 0 then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end

            -- Get Crit Chance
            for i = 1, #jokers do
                totalCrit = totalCrit + jokers[i].ability.extra.currentCrit
            end

            for i = 1, #jokers do
                jokers[i].ability.extra.totalCrit = totalCrit
            end
        end
        
        if context.cardarea == G.play and context.individual and card.ability.extra.critLeader then                                    
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_infinity_edge', card.ability.extra.totalCrit, 100)
            
            if crit and not (next(SMODS.get_enhancements(context.other_card)) == 'm_stone') then
                return {
                    chips = context.other_card:get_id() * (card.ability.extra.currentDMG / 100 - 1),
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
            
        end
    end,
    add_to_deck = function (self, card, context)
        local jokers = {}

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.extra.currentCrit and G.jokers.cards[i].ability.extra.currentCrit >= 0 then
                jokers[#jokers + 1] = G.jokers.cards[i]

                if G.jokers.cards[i].ability.extra.critLeader and G.jokers.cards[i] ~= card then
                    card.ability.extra.critLeader = false
                    break
                end
            end
        end
    end,
    remove_from_deck = function(self, card, context)
        local jokers = {}

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.extra.critDMG and G.jokers.cards[i].ability.extra.critDMG >= 0 then
                jokers[#jokers + 1] = G.jokers.cards[i]
            end
        end

        for i = 1, #jokers do
            if jokers[i].ability.extra.currentDMG > jokers[i].ability.extra.critDMG then
                jokers[i].ability.extra.currentDMG = jokers[i].ability.extra.currentDMG - card.ability.extra.critDMGAugment
            end
        end

        for i = 1, #jokers do
            if jokers[i] ~= card then
                jokers[i].ability.extra.critLeader = true
                break
            end
        end
    end
}