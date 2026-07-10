SMODS.Joker {
    key = 'warmogs_armor',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 21
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            interest = 0,
            dollars = 0,
            dollarGain = 5,
            triggered = true
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.interest,
                card.ability.extra.dollars,
                card.ability.extra.dollarGain,
                card.ability.extra.triggered
            }
        }
    end,
    calculate = function(self, card, context)
        if G.shop and not context.ending_shop and not context.blueprint and not card.ability.extra.triggered then
            card.ability.extra.interest = math.floor(G.GAME.dollars)
            card.ability.extra.triggered = true
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollarGain
        end

        if context.ending_shop and not context.blueprint then
            if math.floor(G.GAME.dollars) < card.ability.extra.interest then
                card.ability.extra.dollars = 0
            end
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.triggered = false
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}