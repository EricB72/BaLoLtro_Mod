SMODS.Joker {
    key = 'spectral_cutlass',
    atlas = 'uncommon_league_items',
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            deduction = 0,
            skips = 3,
            skipsDone = 0
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.deduction,
                card.ability.extra.skips,
                card.ability.extra.skipsDone
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.skipsDone = card.ability.extra.skipsDone + 1
        end

        if card.ability.extra.skipsDone >= card.ability.extra.skips then
            local eval = function(card) return not card.REMOVED end
            juice_card_until(card, eval, true)
            card.ability.extra.deduction = card.ability.extra.deduction + 1
            card.ability.extra.skipsDone = 0
        end

        if context.selling_self and card.ability.extra.deduction > 0 then
            ease_ante(-card.ability.extra.deduction)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.deduction
        end
    end
}