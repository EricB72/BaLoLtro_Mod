SMODS.Joker {
    key = 'bastionbreaker',
    atlas = 'common_league_items',
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            xmulUpg = 2,
            active = false,
            skips = 0,
            boss = false
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmulUpg,
                card.ability.extra.active,
                card.ability.extra.skips,
                card.ability.extra.boss
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.blind.boss then
            if card.ability.extra.active then
                return {
                    xmult = card.ability.extra.xmulUpg * #G.jokers.cards
                }
            else
                return {
                    xmult = card.ability.extra.xmult * #G.jokers.cards
                }
            end
        end

        if context.skip_blind and not context.blueprint then
            card.ability.extra.skips = card.ability.extra.skips + 1
        end

        if context.setting_blind and not context.blueprint and G.GAME.blind.boss then
            card.ability.extra.boss = true

            if card.ability.extra.skips >= 2 then
                card.ability.extra.active = true
                card.ability.extra.skips = 0
            else
                card.ability.extra.active = false
            end
        end

        if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.xmult = 1
            card.ability.extra.active = false
            card.ability.extra.boss = false
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "xmult"
            },
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                },
            }
            },
            calc_function = function(card)
                if card.ability.extra.boss then
                    if card.ability.extra.active then
                        card.joker_display_values.xmult = card.ability.extra.xmulUpg * #G.jokers.cards
                    else
                        card.joker_display_values.xmult = card.ability.extra.xmult * #G.jokers.cards
                    end
                else
                    card.joker_display_values.xmult = 1
                end
            end
        }
    end
}