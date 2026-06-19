SMODS.Joker {
    key = 'essence_reaver',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 3
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
            critLeader = true
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
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
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_essence_reaver', card.ability.extra.totalCrit, 100)

            if crit and not (next(SMODS.get_enhancements(context.other_card)) == 'm_stone') then
                return { 
                    chips = context.other_card:get_id() * (card.ability.extra.currentDMG / 100 - 1),
                    message = localize('b_crit'),
                    colour = G.C.RED
                }
            end
        end

        -- Spellblade
        if context.joker_main then
            if card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard then
                card.ability.extra.prevHand = context.scoring_name
                card.ability.extra.mult = card.ability.extra.totalCrit

                if not next(SMODS.get_enhancements(context.scoring_hand[1])) and not context.scoring_hand[1].debuff then
                    context.scoring_hand[1]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])
                end

                return {
                    mult = card.ability.extra.mult
                }
            else
                card.ability.extra.prevHand = context.scoring_name
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