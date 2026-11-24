SMODS.Joker {
    key = 'rite_of_ruin',
    atlas = 'league_items_good',
    pos = {
        x = 20,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            percentagePer = 5,
            ecrit_chance = 0,
            crit_mult = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_ecrit' }
        local num, den = SMODS.get_probability_vars(
            card, card.ability.extra.ecrit_chance, 100, 'tstmod_ecrit')
        return {
            vars = {
                card.ability.extra.percentagePer,
                card.ability.extra.ecrit_chance,
                card.ability.extra.crit_mult,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            for _, _card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(_card)) then 
                    card.ability.extra.ecrit_chance = card.ability.extra.ecrit_chance + card.ability.extra.percentagePer
                    card.ability.extra.crit_mult = card.ability.extra.crit_mult + card.ability.extra.percentagePer
                end
            end

        if (context.final_scoring_step or context.end_of_round) and not context.blueprint then
            card.ability.extra.ecrit_chance = 0
            card.ability.extra.crit_mult = 0
        end
    end
end
}