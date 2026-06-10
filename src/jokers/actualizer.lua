SMODS.Joker {
    key = 'act',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 2
    },
    config = {
        extra = {
            hands = -1,
            mod_conv = {'m_lucky', 'm_mult', 'm_glass', 'm_bonus', 'm_wild', 'm_steel', 'm_gold', 'm_stone'},
            mod_seals = {'Purple', 'Blue', 'Red', 'Gold'}
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.mod_conv,
                card.ability.extra.mod_seals
        }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            if G.GAME.blind then
                for i = 1, #G.hand.cards do
                    G.hand.cards[i]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])                
                end
                for i = 1, #G.hand.highlighted do
                    G.hand.highlighted[i]:set_ability(card.ability.extra.mod_conv[math.floor(math.random(1, #card.ability.extra.mod_conv))])
                    G.hand.highlighted[i]:set_seal(card.ability.extra.mod_seals[math.floor(math.random(1, #card.ability.extra.mod_seals))], nil, true)
                end
            end
        end
    end,
    added_to_deck = function ()
        ease_hands_played(card.ability.extra.hands)
    end,
    remove_from_deck = function(self, card, from_debuff)
        ease_hands_played(-card.ability.extra.hands)
    end,
}