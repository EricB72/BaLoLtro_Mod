SMODS.Joker {
    key = 'locket_of_the_iron_solari',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 11
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            spellShield = "foil"
        }
    },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue + 1] = G.P_CENTERS.e_tstmod_spell_shield
        return {
            vars = {
                card.ability.extra.spellShield
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].edition and not G.jokers.cards[i].temp_edition then
                    G.jokers.cards[i]:set_edition({ e_tstmod_spell_shield = true }, true)
                end
            end
        end
    end
}