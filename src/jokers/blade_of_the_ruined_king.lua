SMODS.Joker {
    key = 'bork',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
            percentage = 3,
            timesTo = 3,
            lastNum = 0,
            highCard = 'High Card',
            reset = 0,
            scalar = 1
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.timesTo,
                card.ability.extra.lastNum,                
                card.ability.extra.highCard,
                card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == card.ability.extra.highCard then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'lastNum',
                    scalar_value = 'scalar',
                })
            
            if card.ability.extra.lastNum < (card.ability.extra.timesTo) then
                return {
                chips = G.GAME.blind.chips * card.ability.extra.percentage / 100
            }
            else
                card.ability.extra.lastNum = card.ability.extra.reset
                return {
                    chips = G.GAME.blind.chips * card.ability.extra.percentage / 100,
                    mult = G.GAME.blind.chips * card.ability.extra.percentage / 100
                }
            end
        elseif context.joker_main and context.scoring_name ~= card.ability.extra.highCard then
            card.ability.extra.lastNum = card.ability.extra.reset
        end
    end
}