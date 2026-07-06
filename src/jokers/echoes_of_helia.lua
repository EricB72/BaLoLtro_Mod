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
            percentage = 1
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scoreDone,
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round or context.setting_blind then
            card.ability.extra.scoreDone = 0
            card.ability.extra.chips = 0
        end
        
        if context.before then
            card.ability.extra.chips = card.ability.extra.scoreDone
        end

        if context.after then
            card.ability.extra.scoreDone = SMODS.calculate_round_score(flames) * card.ability.extra.percentage / 100
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}