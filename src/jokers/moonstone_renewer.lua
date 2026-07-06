SMODS.Joker {
    key = 'moonstone_renewer',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 13
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            perEach = 0.01,
            augment = 0.1
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.perEach,
                card.ability.extra.augment
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enhanced = {}
            local perTotal = 0

            for i = 1, #context.scoring_hand do
                if next(SMODS.get_enhancements(context.scoring_hand[i])) and not context.scoring_hand[i].debuff and not context.scoring_hand[i].vampired then
                    enhanced[#enhanced + 1] = context.scoring_hand[i]

                    if context.scoring_hand[i + 1] and next(SMODS.get_enhancements(context.scoring_hand[i + 1])) then
                        perTotal = perTotal + card.ability.extra.augment
                    else
                        perTotal = perTotal + card.ability.extra.perEach
                    end

                    context.scoring_hand[i].vampired = true
                    context.scoring_hand[i]:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[i]:juice_up()
                            context.scoring_hand[i].vampired = nil
                            return true
                        end
                    }))
                end
            end

            if #enhanced > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + perTotal
                card.ability.extra.perEach = 0.01

                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
            }
        }
    end
}