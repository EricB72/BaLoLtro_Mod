SMODS.Joker {
    key = 'demonic_embrace',
    atlas = 'legendary_league_items',
    pos = {
        x = 2,
        y = 4
    },
    soul_pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 79,
        h = 78
    },
    config = {
        extra = {
            xchips = 1.45,
            currChips = 0,
            xmult = 1.45,
            currMult = 0,
            augment = 4.5
        }
    },
    rarity = 4,
    cost = 11,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.currChips,
                card.ability.extra.xmult,
                card.ability.extra.currMult,
                card.ability.extra.augment
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind or context.before then
            card.ability.extra.currChips = SMODS.get_scoring_parameter('chips', flames)
            card.ability.extra.currMult = SMODS.get_scoring_parameter('mult', flames)
        end

        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand or card.area == G.jokers) and (card.ability.extra.currChips ~= SMODS.get_scoring_parameter('chips', flames) or card.ability.extra.currMult ~= SMODS.get_scoring_parameter('mult', flames)) and not context.end_of_round then
            local percent = 1 + ((SMODS.get_scoring_parameter('chips', flames) * SMODS.get_scoring_parameter('mult', flames)) / G.GAME.blind.chips)

            if percent > card.ability.extra.augment then percent = card.ability.extra.augment end
            
            if card.ability.extra.currChips ~= SMODS.get_scoring_parameter('chips', flames) and card.ability.extra.currMult ~= SMODS.get_scoring_parameter('mult', flames) then
                card.ability.extra.currChips = SMODS.get_scoring_parameter('chips', flames) * card.ability.extra.xchips * percent
                card.ability.extra.currMult = SMODS.get_scoring_parameter('mult', flames) * card.ability.extra.xmult * percent
                
                return {
                    message_card = card,
                    xchips = card.ability.extra.xchips * percent,
                    xmult = card.ability.extra.xmult * percent
                }
            elseif card.ability.extra.currChips ~= SMODS.get_scoring_parameter('chips', flames) then
                card.ability.extra.currChips = SMODS.get_scoring_parameter('chips', flames) * card.ability.extra.xchips * percent

                return {
                    message_card = card,
                    xchips = card.ability.extra.xchips * percent,
                }
            else
                card.ability.extra.currMult = SMODS.get_scoring_parameter('mult', flames) * card.ability.extra.xmult * percent

                return {
                    message_card = card,
                    xmult = card.ability.extra.xmult * percent
                }
            end
        end
    end
}