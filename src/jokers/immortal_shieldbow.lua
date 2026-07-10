SMODS.Joker {
    key = 'immortal_shieldbow',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 0,
            discard = 1,
            timesScore = 2,
            percentage = 10,
            prevScore = 0,
            critChance = 25,
            currentCrit = 25,
            critDMG = 175,
            currentDMG = 175,
            totalCrit = 25,
            critLeader = true,
            
            -- Other items
            lord_dominiks = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.totalCrit, 100, 'j_tstmod_immortal_shieldbow')
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.discard,
                card.ability.extra.timesScore,
                card.ability.extra.percentage,
                card.ability.extra.prevScore,
                card.ability.extra.critDMG,
                card.ability.extra.critChance,
                card.ability.extra.currentCrit,
                card.ability.extra.currentDMG,
                card.ability.extra.totalCrit,
                card.ability.extra.critLeader,
                numerator,
                denominator,
                
                -- Other items
                card.ability.extra.lord_dominiks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and card.ability.extra.critLeader then            
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_immortal_shieldbow', card.ability.extra.totalCrit, 100)
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

        if context.hand_drawn and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            card.ability.extra.prevScore = G.GAME.chips
        end

        if context.hand_drawn and G.GAME.current_round.hands_played ~= 0 and not context.blueprint then
            if G.GAME.chips >= (card.ability.extra.prevScore * card.ability.extra.timesScore) then
                ease_discard(card.ability.extra.discard)
                card.ability.extra.prevScore = G.GAME.chips
            end
        end

        card.ability.extra.mult = card.ability.extra.currentDMG / card.ability.extra.percentage

        if context.joker_main and not context.blueprint then
            return {
                mult = card.ability.extra.mult
            }
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