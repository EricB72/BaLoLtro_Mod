SMODS.Edition {
    key = "spell_shield",
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {  },
    in_shop = true,
    weight = 7,
    extra_cost = 1,
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if card.debuff then
            card.debuff = false
            card:set_edition(nil, true, true)
        end
    end
}