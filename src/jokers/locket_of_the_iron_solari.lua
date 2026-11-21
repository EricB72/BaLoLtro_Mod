SMODS.Joker {
    key = 'locket_of_the_iron_solari',
    atlas = 'league_items_good',
    pos = {
        x = 52,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            spellShield = "e_tstmod_spell_shield"
        }
    },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_tstmod_spell_shield
        return {
            vars = {
                card.ability.extra.spellShield
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card and not joker.edition then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            joker:set_edition('e_tstmod_spell_shield', true)
                            joker:juice_up(0.5, 0.5)
                            return true
                        end
                    }))
                end
            end
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if initial and not card.edition then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not card.edition then
                        card:set_edition('e_tstmod_spell_shield', true, true)
                    end
                    return true
                end
            }))
        end
    end,
}