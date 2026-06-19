SMODS.Joker {
    key = 'cryptbloom',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 5
    },
    config = {
        extra = {
            chips = 30,
            chipGain = 10,
            dicardGain = 1,
            discards = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.dicardGain,
                card.ability.extra.discards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            ease_discard(card.ability.extra.discards)
        end

        if context.after then
            card.ability.extra.currentPercent = tonumber(tostring((1 - (G.GAME.blind.chips / card.ability.extra.originalBlind)) * 100))
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then            
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain

            if G.GAME.blind.boss then
                card.ability.extra.discards = card.ability.extra.discards + card.ability.extra.dicardGain
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}