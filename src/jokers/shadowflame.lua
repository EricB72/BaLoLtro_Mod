SMODS.Joker {
    key = 'sf',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            maxPercentage = 40,
            critDMG = 120,
            scalar = 0,
            lastNum = 0,
            originalBlind = 0,
            currentDMG = 120,
            
            -- Other items
            lord_dominiks = 0
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        return {
            vars = {
                card.ability.extra.critDMG,
                card.ability.extra.maxPercentage,
                card.ability.extra.scalar,
                card.ability.extra.lastNum,
                card.ability.extra.originalBlind,
                card.ability.extra.currentDMG,
                
                -- Other items
                card.ability.extra.lord_dominiks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.originalBlind = G.GAME.blind.chips
            card.ability.extra.scalar = G.GAME.chips
        end

        if context.cardarea == G.play and context.individual and not context.blueprint then
            card.ability.extra.lastNum = card.ability.extra.scalar / card.ability.extra.originalBlind * 100

            if card.ability.extra.lastNum >= 100 - card.ability.extra.maxPercentage then
                local k = next(SMODS.get_enhancements(context.other_card))
                local percentDmg = 1 + (card.ability.extra.lord_dominiks) * (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante) - 1 * card.ability.extra.lord_dominiks

                local currDMG = (card.ability.extra.currentDMG / 100 - 1) * percentDmg

                if k == 'm_stone' then 
                    return { 
                        chips = 50 * currDMG,
                        message = localize('b_crit'),
                        colour = G.C.BLUE
                    } end
                if k == 'm_lucky' and context.other_card.lucky_trigger then 
                    return { dollars =  20 * currDMG,
                        mult =  20 * currDMG,
                        message = localize('b_crit'),
                        colour = G.C.MONEY
                    } end
                if k == 'm_glass' then 
                    return { 
                        xmult = 1 + currDMG,
                        message = localize('b_crit'),
                        colour = G.C.RED
                    } end
                if k == 'm_mult' then 
                    return { 
                        mult = 4 * currDMG,
                        message = localize('b_crit'),
                        colour = G.C.RED
                    } end
                if k == 'm_bonus' then 
                    return { 
                        chips = 30 * currDMG,
                        message = localize('b_crit'),
                        colour = G.C.CHIPS
                    } end
            end
        end
    end,
    add_to_deck = function (self, card, context)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.critDMG then
                if G.jokers.cards[i] ~= card then
                    card.ability.extra.currentDMG = card.ability.extra.currentDMG + (G.jokers.cards[i].ability.extra.critDMGAugment or 0)

                    if G.jokers.cards[i].ability.extra.critIncrease then card.ability.extra.lord_dominiks = G.jokers.cards[i].ability.extra.critIncrease end
                end
            end
        end
    end
}