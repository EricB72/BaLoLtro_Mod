SMODS.Joker {
    key = 'lich_bane',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 11
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            handSize = 1,
            highCard = 'High Card',
            prevHand = 'None',
            spellblade = true,
            times = 0
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade'}
        return {
            vars = {
                card.ability.extra.handSize,
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.spellblade,
                card.ability.extra.times
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.prevHand ~= card.ability.extra.highCard and context.scoring_name == card.ability.extra.highCard and not context.blueprint then
             G.hand:change_size(card.ability.extra.handSize)
             card.ability.extra.times = card.ability.extra.times + 1
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            G.hand:change_size(-card.ability.extra.times)
            card.ability.extra.times = 0
        end
    end
}