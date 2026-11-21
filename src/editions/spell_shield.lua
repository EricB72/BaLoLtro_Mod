SMODS.Shader{
    key = 'spell_shield',
    path = 'spell_shield.fs',   -- en assets/shaders/ de tu mod
}

SMODS.Edition {
    key = 'spell_shield',
    loc_txt = {
        name = 'Spell Shield',
        label = 'Spell Shield',
        text = { 'Resists a {C:attention}debuff{},', 'then loses this edition.' }
    },
    shader = 'spell_shield',      -- sin efecto visual por ahora
    in_shop = false,
    weight = 0,
    extra_cost = 1,
    config = {},
}

local SHIELD_KEY = 'e_tstmod_spell_shield'  -- e_ + prefijo de tu mod + key

-- 1. Absorber el debuff
local set_debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
    if should_debuff == true and self.edition and self.edition.key == SHIELD_KEY then
        self.ability.shield_spent = true   -- marcamos que ya se usó
        should_debuff = false
    end
    return set_debuff_ref(self, should_debuff)
end

-- 2. Quitar la edición al terminar la blind
local end_round_ref = end_round
function end_round()
    local listas = { G.playing_cards, G.jokers and G.jokers.cards }
    for _, lista in ipairs(listas) do
        for _, c in ipairs(lista) do
            if c.ability and c.ability.shield_spent then
                c.ability.shield_spent = nil
                if c.edition and c.edition.key == SHIELD_KEY then
                    c:set_edition(nil, true)   -- true = sin animación
                end
            end
        end
    end
    return end_round_ref()
end