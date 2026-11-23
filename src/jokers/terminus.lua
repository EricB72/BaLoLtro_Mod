SMODS.Joker {
    key = 'terminus',
    atlas = 'league_items_good',
    pos = {
        x = 41,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            state = false,
            chips = 10,
            mult = 5,
            percentage = 5,
            score = 5
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.state,
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.percentage,
                card.ability.extra.score
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.state then
            card.ability.extra.state = not card.ability.extra.state
               return{
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
               } 
            else
                card.ability.extra.state = not card.ability.extra.state
            return
                {
                    score = card.ability.extra.score * (G.GAME.blind.chips - G.GAME.chips) / 100,
                    blindsize = -(card.ability.extra.percentage * (G.GAME.blind.chips) / 100)
               } 
            end
        end
    end
}