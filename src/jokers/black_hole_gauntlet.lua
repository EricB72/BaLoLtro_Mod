SMODS.Joker {
    key = 'black_hole_gauntlet',
    atlas = 'legendary_league_items',
    pos = {
        x = 0,
        y = 1
    },
    soul_pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 80,
        h = 80
    },
    config = {
        extra = {
            dragAugment = 1,
            dragNum = 0
        }
    },
    rarity = 4,
    cost = 11,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dragAugment,
                card.ability.extra.dragNum
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.dragNum = card.ability.extra.dragNum + card.ability.extra.dragAugment
        end

        if context.setting_blind then
            G.hand:change_size(card.ability.extra.dragNum)
        end

        if context.first_hand_drawn and card.ability.extra.dragNum > 0 then
            G.hand:change_size(-card.ability.extra.dragNum)
            return {
                message = 'DRAGGED'
            }
        end

        if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.dragNum = 0
        end
    end
}