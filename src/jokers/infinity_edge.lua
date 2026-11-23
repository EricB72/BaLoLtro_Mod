SMODS.Joker {
    key = 'infinity_edge',
    atlas = 'league_items_good',
    pos = {
        x = 45,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            crit_chance = 25,
            crit_mult = 30
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local num, den = SMODS.get_probability_vars(
            card, card.ability.extra.crit_chance, 100, 'tstmod_crit')
        return {
            vars = {
                card.ability.extra.crit_chance,
                card.ability.extra.crit_mult,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end
}