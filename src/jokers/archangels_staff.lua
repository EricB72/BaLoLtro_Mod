SMODS.Joker {
    key = 'acs',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {
            chips = 2,
            numOfEnh = 5,
            triggersToEv = 5,
            numOfCardEnh = 1,
            triggers = 0,
            enhCards = 0,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            seraphs = 'j_tstmod_sebr',
            totalEnhCards = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.numOfEnh,
                card.ability.extra.triggersToEv,
                card.ability.extra.numOfCardEnh,
                card.ability.extra.triggers,
                card.ability.extra.enhCards,
                card.ability.extra.mod_conv,
                card.ability.extra.seraphs,
                card.ability.extra.totalEnhCards
        }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.totalEnhCards = 0

            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i].debuff then
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                end
            end

            if card.ability.extra.triggers >= card.ability.extra.numOfEnh then                
                for i = 1, #G.hand.cards do
                    if not next(SMODS.get_enhancements(G.hand.cards[i])) and not G.hand.cards[i].debuff then
                        G.hand.cards[i]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])
                        card.ability.extra.enhCards = card.ability.extra.enhCards + 1
                        card.ability.extra.triggers = card.ability.extra.triggers - card.ability.extra.numOfEnh

                        break
                    end
                end
            end

            for _, playing_card in pairs(G.playing_cards) do
                if next(SMODS.get_enhancements(playing_card)) then card.ability.extra.totalEnhCards = card.ability.extra.totalEnhCards + card.ability.extra.chips end
            end        
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.totalEnhCards
            }
        end

        if context.after then
            if card.ability.extra.enhCards >= card.ability.extra.triggersToEv then
                SMODS.add_card {
                    key = card.ability.extra.seraphs,
                }
                SMODS.destroy_cards(card, nil, nil, true)
            end   
        end
    end
}