SMODS.Joker {
    key = 'liandrys_torment',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percentage = 1,
            increase = 3
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.increase
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if next(SMODS.get_enhancements(context.other_card)) then
                if context.other_card.edition ~= nil or context.other_card.gold_seal ~= nil or context.other_card.seal ~= nil then
                    local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.increase / 100

                    G.GAME.chips = G.GAME.chips + addedAmount

                    return {
                        message = tostring(addedAmount),
                    }
                else
                    local addedAmount = (G.GAME.blind.chips - G.GAME.chips) * card.ability.extra.percentage / 100

                    G.GAME.chips = G.GAME.chips + addedAmount

                    return {
                        message = tostring(addedAmount),
                    }
                end
            end
        end
    end
}