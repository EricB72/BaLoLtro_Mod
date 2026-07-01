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
            totalxMult = 1
 }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
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
                card.ability.extra.higherHand
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

        --Every Crit Item has
        --
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
                local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_fiendhunter_bolts', card.ability.extra.totalCrit, 100)

                if crit and not (next(SMODS.get_enhancements(context.other_card)) == 'm_stone') then
                    return {
                        chips = context.other_card:get_id() * (card.ability.extra.currentDMG / 100 - 1),
                        message = localize('b_crit'),
                        colour = G.C.RED
                    }
                end
            end
        --

        if context.joker_main then
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_fiendhunter_bolts', card.ability.extra.totalCrit, 100)

            if crit then
                return {
                    xmult = card.ability.extra.totalxMult * (card.ability.extra.currentDMG / 100),
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
        local jokers = {}
        --local f = function() return G.jokers.cards[i].ability.extra.currentCrit ~= nil end

        for i = 1, #G.jokers.cards do
            if not pcall(f) and G.jokers.cards[i].ability.extra.critChance >= 0 then
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