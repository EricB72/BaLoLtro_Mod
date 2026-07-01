SMODS.Joker {
    key = 'echoes_of_helia',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            chips = 0,
            scoreDone = 0,
            percentage = 30,
            lastScore = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scoreDone,
                card.ability.extra.percentage,
                card.ability.extra.lastScore
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.lastScore = 0
        end
        
        if context.before then
            card.ability.extra.lastScore = G.GAME.chips
        end

        if context.hand_drawn then
            card.ability.extra.scoreDone = (G.GAME.chips - card.ability.extra.lastScore) * (card.ability.extra.percentage / 100)
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.scoreDone
        end

        if context.joker_main then
            return {
                    chips = card.ability.extra.chips
            }
        end
    end
}