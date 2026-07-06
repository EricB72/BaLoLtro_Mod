SMODS.Joker {
    key = 'mejais_soulstealer',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 12
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            hands = 1,
            dollars = -5,
            triggers = 0
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.dollars,
                card.ability.extra.triggers
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss and not context.blueprint then

            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
            ease_hands_played(card.ability.extra.hands)

            card.ability.extra.triggers = card.ability.extra.triggers + 1

            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.skip_blind then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands * -2
            ease_hands_played(card.ability.extra.hands)

            card.ability.extra.triggers = card.ability.extra.triggers - 2

            return {
                dollars = card.ability.extra.dollars * -2
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.triggers
        ease_hands_played(-card.ability.extra.triggers)
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.ability.extra", ref_value = "triggers", retrigger_type = "mult", colour = G.C.CHIPS },
                { text = " hand/s, " },
                { text = "$", colour = G.C.GOLD },
                { ref_table = "card.ability.extra", ref_value = "dollars", retrigger_type = "mult", colour = G.C.GOLD },
                { scale = 0.4 }
            },
        }
    end
}