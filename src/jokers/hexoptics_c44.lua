SMODS.Joker {
    key = 'hexoptics_c44',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            forEach = 0.5,
            critChance = 25,
            currentCrit = 25,
            critDMG = 175,
            currentDMG = 175,
            totalCrit = 25,
            critLeader = true
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.forEach,
                card.ability.extra.HandNum,
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentCrit,
                card.ability.extra.currentDMG,
                card.ability.extra.totalCrit,
                card.ability.extra.critLeader
            }
        }
    end,
    calculate = function(self, card, context)
        -- Crit
        if context.after and card.ability.extra.critLeader then
            local jokers = {}
            local totalCrit = 0

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.currentCrit and G.jokers.cards[i].ability.extra.currentCrit >= 0 then
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
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_essence_reaver', card.ability.extra.totalCrit, 100)

            if crit and not (next(SMODS.get_enhancements(context.other_card)) == 'm_stone') then
                return { 
                    chips = context.other_card:get_id() * (card.ability.extra.currentDMG / 100 - 1),
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
        end
        --End of Crit
        
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            local left = G.hand.cards[1].base.id
            local right = G.hand.cards[#G.hand.cards].base.id

            card.ability.extra.xmult = (left - right) * card.ability.extra.forEach

            if card.ability.extra.xmult < 1 then card.ability.extra.xmult = 1 end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    add_to_deck = function (self, card, context)
        local jokers = {}

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.currentCrit and G.jokers.cards[i].ability.extra.critChance >= 0 then
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
            if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.currentCrit and G.jokers.cards[i].ability.extra.critChance >= 0 then
                jokers[#jokers + 1] = G.jokers.cards[i]
            end
        end

        for i = 1, #jokers do
            if jokers[i] ~= card then
                jokers[i].ability.extra.critLeader = true
                break
            end
        end
    end,
    
}