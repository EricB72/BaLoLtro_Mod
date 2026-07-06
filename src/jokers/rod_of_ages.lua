SMODS.Joker {
    key = 'rod_of_ages',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 16
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 3,
            chipGain = 3,
            dollars = 1,
            dollarGain = 1,
            maxStacks = 10,
            flush = false
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.dollars,
                card.ability.extra.dollarGain,
                card.ability.extra.maxStacks,
                card.ability.extra.flush
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end        

        if context.modify_scoring_hand and #context.full_hand >= 5 and not context.blueprint then
            local enhancement = next(SMODS.get_enhancements(context.full_hand[1]))
            card.ability.extra.flush = false

            if enhancement then
                card.ability.extra.flush = true

                for i = 2, #context.full_hand do
                    if enhancement ~= next(SMODS.get_enhancements(context.full_hand[i])) then
                        card.ability.extra.flush = false
                    end
                end
            end

            if card.ability.extra.flush then
                return {
                    add_to_hand = true
                }
            end
        end
        

        if G.GAME.blind and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and card.ability.extra.dollars < card.ability.extra.maxStacks then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain
        end
    end,
    calc_dollar_bonus = function(self, card)
        local prevDollars = card.ability.extra.dollars

        if card.ability.extra.dollars < card.ability.extra.maxStacks then card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollarGain end

        return true and prevDollars or nil
    end
}