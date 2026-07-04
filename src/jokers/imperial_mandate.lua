SMODS.Joker {
    key = 'imperial_mandate',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 9
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 5,
            chipGain = 25,
            percent = 10,
            increase = 2,
            prevHand = 0,
            prevDiscard = false,
            disabled = false
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.percent,
                card.ability.extra.increase,
                card.ability.extra.prevHand,
                card.ability.extra.prevDiscard,
                card.ability.extra.disabled
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            card.ability.extra.prevDiscard = true
        end

        if context.joker_main then
            if card.ability.extra.prevDiscard then
                card.ability.extra.prevDiscard = false
                local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percent / 100

                if G.GAME.blind.boss then
                    addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percent * card.ability.extra.increase / 100
                end

                G.GAME.chips = G.GAME.chips + addedAmount

                return {
                    chips = card.ability.extra.chips,
                    message = tostring(addedAmount),
                    message_card = card
                }
            end
        end

        if G.GAME.blind.disabled and not card.ability.extra.disabled and not context.blueprint then
            card.ability.extra.disabled = true
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain
        end

        if context.end_of_round and not context.blueprint then
            card.ability.extra.disabled = false
        end
    end
}