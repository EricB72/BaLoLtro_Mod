SMODS.Joker {
    key = 'blackfire_torch',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 4
    },
    config = {
        extra = {
            chips = 0,
            increase = 1
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.increase
            }
        }
    end,
    calculate = function(self, card, context)
        local new = true
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.before then
            card.ability.extra.prevMult = mult
        end

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
            return {
                chips = card.ability.extra.chips
            }
        end
        
        if context.end_of_round then
            card.ability.extra.chips = 0
        end
    end
}