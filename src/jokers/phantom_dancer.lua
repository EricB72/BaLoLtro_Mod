SMODS.Joker {
    key = 'phantom_dancer',
    atlas = 'league_items_good',
    pos = {
        x = 11,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            chance = 3,
            tags = 1,
            chanceInc = 3
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'j_tstmod_phantom_dancer')

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.chance,
                card.ability.extra.tags,
                card.ability.extra.chanceInc
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.chance = card.ability.extra.chance + card.ability.extra.chanceInc
        end

        if context.ending_shop then
            local tag = SMODS.pseudorandom_probability(card, 'j_tstmod_phantom_dancer', 1, card.ability.extra.chance)

            if tag then
                add_tag(Tag(get_next_tag_key()))
            end
        end
    end
}