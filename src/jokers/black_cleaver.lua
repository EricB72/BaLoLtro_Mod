SMODS.Joker {
    key = 'black_cleaver',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 4
    },
    config = {
        extra = {
            percent = 5,
            maxPercent = 30,
            mult = 20,
            currentPercent = 0,
            originalBlind = 0,
            prevMult = 0,
            currDecrease = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.maxPercent,
                card.ability.extra.mult,
                card.ability.extra.currentPercent,
                card.ability.extra.originalBlind,
                card.ability.extra.prevMult,
                card.ability.extra.currDecrease
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.originalBlind = G.GAME.blind.chips
        end

        if context.before then
            card.ability.extra.prevMult = mult
        end

        if ((context.individual and context.cardarea == G.play) or (card.area and card.area == G.jokers))and not context.blueprint then
            if mult ~= card.ability.extra.prevMult and card.ability.extra.currentPercent < card.ability.extra.maxPercent and mult ~= nil then
                card.ability.extra.currentPercent = card.ability.extra.currentPercent + card.ability.extra.percent
                card.ability.extra.prevMult = mult
            end
        end

        if context.joker_main then
            card.ability.extra.currDecrease = card.ability.extra.originalBlind - card.ability.extra.originalBlind * (100 - card.ability.extra.currentPercent) / 100

            G.GAME.blind.chips = card.ability.extra.originalBlind - card.ability.extra.currDecrease
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            if card.ability.extra.currentPercent >= card.ability.extra.maxPercent then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        
        if context.end_of_round then
            card.ability.extra.currentPercent = 0
            card.ability.extra.currDecrease = 0
        end
    end,
    add_to_deck = function(self, card, context)
        card.ability.extra.originalBlind = G.GAME.blind.chips
    end
}