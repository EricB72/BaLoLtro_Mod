SMODS.Joker {
    key = 'atmas_reckoning',
    atlas = 'league_items_good',
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            crit_chance = 20,
            maxCritChance = 50,
            moneyNeeded = 1,
            moneyThreshold = 25,
        }
    },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local num, den = SMODS.get_probability_vars(
            card, card.ability.extra.crit_chance, 100, 'tstmod_crit')
        return {
            vars = {
                card.ability.extra.crit_chance,
                card.ability.extra.maxCritChance,
                card.ability.extra.moneyNeeded,
                card.ability.extra.moneyThreshold,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.crit_chance = math.min(20 + math.max((G.GAME.dollars or G.GAME.dollar_buffer or 0) - card.ability.extra.moneyThreshold, 0), card.ability.extra.maxCritChance)
    end
}