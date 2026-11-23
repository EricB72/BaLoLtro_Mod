SMODS.Joker {
    key = 'lord_dominiks_regards',
    atlas = 'league_items_good',
    pos = {
        x = 53,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {

        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        local ante = G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante or 1
        local num, den = SMODS.get_probability_vars(
            card, 0, 100, 'tstmod_crit')
        return { vars = { 
            math.max(1, ante) ,
            string.format('%g', (tstmod_crit_percent(card) or 0)),
            den,
            string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
        } 
    }
    end,
    -- Multiplicador que aporta a los críticos (mínimo x1 para que Ante 0 no los anule)
    crit_x = function(self, card)
        return math.max(1, G.GAME.round_resets.ante)
    end,
}