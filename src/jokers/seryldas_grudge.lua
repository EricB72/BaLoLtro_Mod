SMODS.Joker {
    key = 'seryldas_grudge',
    atlas = 'league_items_good',
    pos = {
        x = 26,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            percentage = 50,
            score = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.score
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.score = (G.hand.config.card_limit or 0)
        if context.joker_main and G.GAME.chips / G.GAME.blind.chips * 100 >= card.ability.extra.percentage then
            return {
                score = card.ability.extra.score * G.GAME.blind.chips / 100
            }
        end
    end
}