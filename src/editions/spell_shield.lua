local spellshield_shader = {
	object_type = "Shader",
	key = "spell_shield",
	path = "spell_shield.fs",
}

SMODS.Edition {
    key = "spell_shield",
    shader = 'spell_shield',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { chips = 50 },
    in_shop = true,
    weight = 0,
    extra_cost = 2,
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.chips } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips
            }
        end
    end
}

local spellshield_shader = {
	object_type = "Shader",
	key = "spell_shield",
	path = "spell_shield.fs",
}