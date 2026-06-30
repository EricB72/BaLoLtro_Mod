SMODS.Joker {
    key = 'bloodthirster',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 4
    },
    config = {
        extra = {
            mult = 30,
            numHands = 1,
            everyHands = 3,
            numDiscards = 1,
            baseDiscards = 0,
            handsPlayed = 0
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.numHands,
                card.ability.extra.everyHands,
                card.ability.extra.numDiscards,
                card.ability.extra.baseDiscards,
                card.ability.extra.handsPlayed
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.setting_blind then
            card.ability.extra.baseDiscards = G.GAME.current_round.discards_left
        end

        if not card.ability.extra.baseDiscard == 0 and G.GAME.current_round.discards_left ~= nil and G.GAME.current_round.discards_left > card.ability.extra.baseDiscards then
            ease_hands_played(card.ability.extra.numHands)
            card.ability.extra.baseDiscards = G.GAME.current_round.discards_left
        end

        if context.before then
            card.ability.extra.handsPlayed = card.ability.extra.handsPlayed + 1
            if card.ability.extra.handsPlayed >= card.ability.extra.everyHands then
                ease_discard(card.ability.extra.numDiscards)
                card.ability.extra.handsPlayed = 0
            end
        end
    end
}