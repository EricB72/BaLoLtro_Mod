SMODS.Joker {
    key = 'ludens_echo',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 11
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            bonus = 'm_bonus',
            chipPer = 5
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        local bonus_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) and next(SMODS.get_enhancements(playing_card)) == card.ability.extra.bonus then bonus_Cards = bonus_Cards + card.ability.extra.chipPer end
        end
        local bonusCards = bonus_Cards / card.ability.extra.chipPer
        return {
            vars = {
                card.ability.extra.bonus,
                bonus_Cards,
                card.ability.extra.chipPer,
                bonusCards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enh_Cards = {}

            for i = 1, #context.scoring_hand do
                if next(SMODS.get_enhancements(context.scoring_hand[i])) and not context.scoring_hand[i].debuff and next(SMODS.get_enhancements(context.scoring_hand[i])) == card.ability.extra.bonus then
                    if context.scoring_hand[i - 1] and not next(SMODS.get_enhancements(context.scoring_hand[i - 1])) == card.ability.extra.bonus then
                        enh_Cards[#enh_Cards + 1] = context.scoring_hand[i - 1]
                    end

                    if context.scoring_hand[i + 1] and not next(SMODS.get_enhancements(context.scoring_hand[i + 1])) == card.ability.extra.bonus then
                        enh_Cards[#enh_Cards + 1] = context.scoring_hand[i + 1]
                    end
                end
            end

            for i = 1, #enh_Cards do
                enh_Cards[i]:set_ability(card.ability.extra.bonus, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        enh_Cards[i]:juice_up()
                        return true
                    end
                }))
            end

            if #enh_Cards > 0 then
                return {
                    message = localize('k_bonus'),
                    colour = G.C.BLUE
                }
            end
        end
        
        if context.joker_main then
            local bonus_Cards = 0
            
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) and next(SMODS.get_enhancements(playing_card)) == card.ability.extra.bonus then bonus_Cards = bonus_Cards + card.ability.extra.chipPer end
            end

            return {
                chips = bonus_Cards
            }
        end
    end
}