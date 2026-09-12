SMODS.Joker {
    key = 'hextech_gunblade',
    atlas = 'uncommon_league_items',
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            percent = 25,
            hand = 1,
            discard = 1
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.hand,
                card.ability.extra.discard
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            if G.GAME.blind then
                ease_hands_played(card.ability.extra.hand)
                ease_discard(card.ability.extra.discard)

                return {
                    score = G.GAME.blind.chips * card.ability.extra.percent / 100
                }
            end
        end
    end
}