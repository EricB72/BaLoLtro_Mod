SMODS.Joker {
    key = 'dawncore',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 5
    },
    config = {
        extra = {
            xchips = 1,
            chipGain = 0.05,
            enhNum = 0,
            totalDeck = 0,
            retrigger = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.chipGain,
                card.ability.extra.enhNum,
                card.ability.extra.totalDeck,
                card.ability.extra.retrigger
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.totalDeck = #G.playing_cards

            if card.ability.extra.enhNum >= card.ability.extra.totalDeck then
                card.ability.extra.retrigger = 2
            else
                card.ability.extra.retrigger = 0
            end            
        end

        if context.repetition and context.cardarea == G.play then
            if card.ability.extra.retrigger > 0 then
                return {
                    repetitions = card.ability.extra.retrigger
                }
            end
        end
        
        if context.joker_main then
            card.ability.extra.enhNum = 0

            for i = 1, card.ability.extra.totalDeck do
                if next(SMODS.get_enhancements(G.playing_cards[i])) then
                    card.ability.extra.enhNum = card.ability.extra.enhNum + 1
                end
            end

            card.ability.extra.xchips = 1 + card.ability.extra.enhNum * card.ability.extra.chipGain

            return {
                xchips = card.ability.extra.xchips
            }
        end
    end
}