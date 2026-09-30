SMODS.Joker {
    key = 'yun_tal_wildarrows',
    atlas = 'league_items_good',
    pos = {
        x = 55,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            chance = 10,
            chanceInc = 10,
            handSize = 1,
            highCard = 'High Card',
            triggers = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.chance, 100, 'j_tstmod_yun_tal_wildarrows')
        return {
            vars = {
                card.ability.extra.chance,
                card.ability.extra.chanceInc,
                card.ability.extra.handSize,
                card.ability.extra.highCard,
                card.ability.extra.triggers,
                numerator,
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.highCard then
            local crit = SMODS.pseudorandom_probability(card, 'j_tstmod_yun_tal_wildarrows', card.ability.extra.chance, 100)

            if crit then
                G.hand:change_size(card.ability.extra.handSize)
                card.ability.extra.triggers = card.ability.extra.triggers + 1
            end

            card.ability.extra.chance = card.ability.extra.chance + card.ability.extra.chanceInc
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for i = 1, card.ability.extra.triggers, 1 do
                G.hand:change_size(-card.ability.extra.handSize)
            end

            card.ability.extra.triggers = 0
            card.ability.extra.chance = 10
        end
    end
}