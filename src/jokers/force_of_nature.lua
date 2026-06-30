SMODS.Joker {
    key = 'force_of_nature',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 7
    },
    config = {
        extra = {
            chips = 0,
            stacks = 0,
            chipGain = 50,
            handSize = 0,
            handIncrease = 1,
            everyX = 15
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.stacks,
                card.ability.extra.chipGain,
                card.ability.extra.handSize,
                card.ability.extra.handIncrease,
                card.ability.extra.everyX
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop or context.create_booster_card then
            card.ability.extra.stacks = card.ability.extra.stacks + 1
        end

        if context.ending_shop then
            for i = card.ability.extra.everyX, card.ability.extra.stacks, card.ability.extra.everyX do
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain
                card.ability.extra.handSize = card.ability.extra.handSize + card.ability.extra.handIncrease
            end

            G.hand:change_size(card.ability.extra.handSize)
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            G.hand:change_size(-card.ability.extra.handSize)

            card.ability.extra.handSize = 0
            card.ability.extra.stacks = 0
        end
    end
}