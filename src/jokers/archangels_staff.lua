SMODS.Joker {
    key = 'acs',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {
            chips = 1,
            numOfEnh = 10,
            triggersToEv = 5,
            numOfCardEnh = 1,
            triggers = 0,
            enhCards = 0,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            seraphs = 'sec'
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
                card.ability.extra.seraphs
        }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.scoring_hand do
                if next(SMODS.get_enhancements(context.scoring_hand[i])) and not context.scoring_hand[i].debuff then
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                end
            end
            if card.ability.extra.triggers >= card.ability.extra.numOfEnh then
                G.hand.cards[math.floor(math.random(1, #G.hand.cards))]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])
                card.ability.extra.enhCards = card.ability.extra.enhCards + 1
                card.ability.extra.triggers = card.ability.extra.triggers - card.ability.extra.numOfEnh
            end
        end

        if context.joker_main then
            local enchCards = 0
            for _, playing_card in pairs(G.playing_cards) do
                if next(SMODS.get_enhancements(playing_card)) then enchCards = enchCards + 1 end
            end

            return {
                chips = card.ability.extra.chips * enchCards
            }
        end

        if context.end_of_round and card.ability.extra.enhCards >= card.ability.extra.triggersToEv then
            --card.ability.extra.seraphs:add_to_deck()
            G.jokers:emplace(card.ability.extra.seraphs)
        end
    end
}