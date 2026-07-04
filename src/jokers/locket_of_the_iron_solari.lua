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
            spellShield = 'e_tstmod_spell_shield'
        }
    },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.spellShield
            }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, #G.jokers.cards do
                G.jokers.cards[i]:set_edition(card.ability.extra.spellShield, true, false, true)
            end
        end
    end
}