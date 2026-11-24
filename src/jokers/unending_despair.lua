SMODS.Joker {
    key = 'unending_despair',
    atlas = 'league_items_good',
    pos = {
        x = 47,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            eveyXHands = 2,
            discards = 1,
            multiplier = 10
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.eveyXHands,
                card.ability.extra.discards,
                card.ability.extra.multiplier
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and  (G.GAME.current_round.hands_played + 1) % card.ability.extra.eveyXHands == 0 then
            ease_discard(card.ability.extra.discards)

            return {
                score = card.ability.extra.multiplier * (G.GAME.dollars or G.GAME.dollar_buffer or 0)
            }
        end
    end
}