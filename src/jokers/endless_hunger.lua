SMODS.Joker {
    key = 'endless_hunger',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 6
    },
    config = {
        extra = {
            dollars = 5,
            decrease = 4,
            luckNumerator = 1,
            currentDenominator = 30
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.decrease,
                card.ability.extra.luckNumerator,
                card.ability.extra.currentDenominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.modify_hand then
            card.ability.extra.luckNumerator = tonumber(tostring(mult))
        end

        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * (1 + (card.ability.extra.luckNumerator / card.ability.extra.currentDenominator))
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.blind.boss then
            card.ability.extra.currentDenominator = card.ability.extra.currentDenominator - card.ability.extra.decrease

            if card.ability.extra.currentDenominator < 1 then card.ability.extra.currentDenominator = 1 end
            
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end
}