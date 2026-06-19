SMODS.Joker {
    key = 'axiom_arc',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 3
    },
    config = {
        extra = {
            mult = 20,
            numHands = 2,
            luckNumerator = 0,
            luckDenominator = 10,
            luckDecrease = 0,
            currentDenominator = 10,
            eachDicard = 2,
            minDenominator = 0.125
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.numHands,
                card.ability.extra.luckNumerator,
                card.ability.extra.luckDenominator,
                card.ability.extra.luckDecrease,
                card.ability.extra.currentDenominator,
                card.ability.extra.eachDicard,
                card.ability.extra.minDenominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.luckDecrease = card.ability.extra.luckDecrease + G.GAME.current_round.discards_left * card.ability.extra.eachDicard

            if G.GAME.current_round.hands_played <= card.ability.extra.numHands and not context.beat_boss then
                card.ability.extra.luckNumerator = 1
            elseif context.beat_boss then
                card.ability.extra.luckNumerator = 0
                card.ability.extra.luckDecrease = 0
            end

            card.ability.extra.currentDenominator = card.ability.extra.luckDenominator - card.ability.extra.luckDecrease

            if card.ability.extra.currentDenominator <= 0 then
                local curr = card.ability.extra.currentDenominator
                card.ability.extra.currentDenominator = 1
                
                for i = curr, 0, 1 do
                    card.ability.extra.currentDenominator = card.ability.extra.currentDenominator / 2
                end

                if card.ability.extra.currentDenominator < card.ability.extra.minDenominator then
                    card.ability.extra.currentDenominator = card.ability.extra.minDenominator
                end
            end
        end

        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * (1 + (card.ability.extra.luckNumerator / card.ability.extra.currentDenominator))
            }
        end
    end
}