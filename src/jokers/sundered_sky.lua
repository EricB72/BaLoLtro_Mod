SMODS.Joker {
    key = 'sundered_sky',
    atlas = 'league_items_good',
    pos = {
        x = 38,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            crit_chance = 0,
            crit_mult = 0,
            handNum = 0
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local num, den = SMODS.get_probability_vars(
            card, card.ability.extra.crit_chance, 100, 'tstmod_crit')
        return {
            vars = {
                card.ability.extra.crit_chance,
                card.ability.extra.crit_mult,
                card.ability.extra.handNum,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played == card.ability.extra.handNum then
            card.ability.extra.crit_chance = 100
            card.ability.extra.crit_mult = 0.5
        end

        if context.final_scoring_step and not context.blueprint then
            card.ability.extra.crit_chance = 0
            card.ability.extra.crit_mult = 0
        end
    end
}