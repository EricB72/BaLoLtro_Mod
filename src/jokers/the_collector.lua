SMODS.Joker {
    key = 'the_collector',
    atlas = 'league_items_good',
    pos = {
        x = 42,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            crit_chance = 20,
            dollars = 5,
            percent = 5,
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local blindPercent = 'NaN'
        if G.GAME.chips and G.GAME.blind and G.GAME.blind.chips then
            blindPercent = (G.GAME.chips / G.GAME.blind.chips * 100) or 'NaN'        
        end
        local num, den = SMODS.get_probability_vars(
            card, card.ability.extra.crit_chance, 100, 'tstmod_crit')
        return {
            vars = {
                card.ability.extra.crit_chance,
                card.ability.extra.dollars,
                card.ability.extra.percent,
                blindPercent,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and G.GAME.blind and G.GAME.blind.chips then
            local blindPercent = G.GAME.chips / G.GAME.blind.chips * 100
            local de_la_mano = (SMODS.Scoring_Parameters.chips.current or 0) * (SMODS.Scoring_Parameters.mult.current or 0)
            local blindLeftAmount = G.GAME.blind.chips -(G.GAME.chips + de_la_mano)

            if blindPercent > (100 - card.ability.extra.percent) and blindPercent < 100 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tstmod_executed_collector')
                        return true
                    end
                }))

                return {
                    score = blindLeftAmount,
                    dollars = card.ability.extra.dollars,
                    message = localize('b_exectued'),
                    message_colour = G.C.PURPLE
                }
            end
        end
    end,
    SMODS.Sound{ key = 'executed_collector', path = 'Collector_passive_SFX.ogg'}
}