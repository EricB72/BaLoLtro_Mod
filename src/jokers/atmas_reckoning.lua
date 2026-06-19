SMODS.Joker {
    key = 'atmas_reckoning',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 2
    },
    config = {
        extra = {
            critChance = 20,
            maxCritChance = 30,
            moneyNeeded = 1,
            currentCrit = 20,
            critDMG = 175,
            moneyThreshold = 25,
            currentDMG = 175,
            totalCrit = 20,
            critLeader = true
 }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_atmas_reckoning')
        return {
            vars = {
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.maxCritChance,
                card.ability.extra.moneyNeeded,
                card.ability.extra.currentCrit,
                card.ability.extra.moneyThreshold,
                card.ability.extra.currentDMG,
                numerator, 
                denominator,
                card.ability.extra.totalCrit,
                card.ability.extra.critLeader
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            local currMoney = tonumber(tostring(G.GAME.dollars))
            
            if currMoney > card.ability.extra.moneyThreshold then
                card.ability.extra.currentCrit = card.ability.extra.critChance - card.ability.extra.moneyThreshold + currMoney / card.ability.extra.moneyNeeded
            end
            
            if card.ability.extra.currentCrit > (card.ability.extra.maxCritChance + card.ability.extra.critChance) then card.ability.extra.currentCrit = (card.ability.extra.maxCritChance + card.ability.extra.critChance) end
        end

        if context.after and card.ability.extra.critLeader then
            local jokers = {}
            local totalCrit = 0

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.extra.currentCrit ~= nil and G.jokers.cards[i].ability.extra.currentCrit >= 0 then
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
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_atmas_reckoning', card.ability.extra.totalCrit, 100)

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
            if G.jokers.cards[i].ability.extra.currentCrit ~= nil and G.jokers.cards[i].ability.extra.critChance >= 0 then
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
            if G.jokers.cards[i].ability.extra.currentCrit ~= nil and G.jokers.cards[i].ability.extra.critChance >= 0 then
                jokers[#jokers + 1] = G.jokers.cards[i]
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