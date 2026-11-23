SMODS.Joker {
    key = 'essence_reaver',
    atlas = 'league_items_good',
    pos = {
        x = 26,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            spellblade = false,
            crit_chance = 10,
            nextEnh = 'IDK',
            enhancement = 0,
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_crit' }
        local num, den = SMODS.get_probability_vars(
                    card, card.ability.extra.crit_chance, 100, 'tstmod_crit')

        return {
            vars = {
                card.ability.extra.spellblade,
                card.ability.extra.crit_chance,
                card.ability.extra.nextEnh,
                card.ability.extra.enhancement,
                string.format('%g', (tstmod_crit_percent(card) or 0)),
                den,
                string.format('%.2f', (tstmod_stat_total('crit_mult', 175) / 100 or 0))
            }
        }
    end,
    calculate = function(self, card, context)
        -- Spellblade
        if context.tstmod_spellblade then
            card.ability.extra.spellblade = true
        end

        if context.individual and context.cardarea == G.play
            and card.ability.extra.spellblade and not context.blueprint then

        local _card = context.other_card
        if _card and not _card.debuff and not context.repetition
        and not _card.tstmod_pendiente
        and not next(SMODS.get_enhancements(_card)) then

            -- Asegurar que la mejora guardada es válida
            local function valida(k)
                return type(k) == 'string' and k ~= 'c_base' and G.P_CENTERS[k]
            end
            if not valida(card.ability.extra.enhancement) then
                card.ability.extra.enhancement =
                    SMODS.poll_enhancement { guaranteed = true, key = 'j_tstmod_essence_reaver' }
            end

            -- Tomar la de ESTA carta y preparar la siguiente YA (no dentro del evento)
            local enh = card.ability.extra.enhancement
            card.ability.extra.enhancement =
                SMODS.poll_enhancement { guaranteed = true, key = 'j_tstmod_essence_reaver' }
            card.ability.extra.nextEnh = localize {
                type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement }

            -- Marcar la carta como "pendiente" para que nadie más la toque
            _card.tstmod_pendiente = true

            G.E_MANAGER:add_event(Event({
                func = function()
                    _card.tstmod_pendiente = nil
                    if not next(SMODS.get_enhancements(_card)) then   -- recomprobar
                        _card:set_ability(G.P_CENTERS[enh])
                        _card:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))

            return { message = localize('k_enhanced') }
        end
    end

        if context.joker_main and card.ability.extra.spellblade then
            card.ability.extra.spellblade = false

            return {
                mult = card.ability.extra.crit_chance
            }

        end
    end,
    add_to_deck = function (self, card)
        card.ability.extra.enhancement = SMODS.poll_enhancement { guaranteed = true, key = "j_tstmod_essence_reaver" }
        card.ability.extra.nextEnh = localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement } 
    end
}