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
            hands = 0,
            handGain = 1,
            dollars = 5,
            dollarGain = 5
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.handGain,
                card.ability.extra.dollars,
                card.ability.extra.dollarGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.hands = card.ability.extra.hands + card.ability.extra.handGain

            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
            ease_hands_played(card.ability.extra.hands)

            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.skip_blind then
            card.ability.extra.hands = card.ability.extra.hands + card.ability.extra.handGain * -2

            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands

            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollarGain * -2

            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.ability.extra", ref_value = "hands", retrigger_type = "mult", colour = G.C.CHIPS },
                { text = " hand/s, " },
                { text = "$", colour = G.C.GOLD },
                { ref_table = "card.ability.extra", ref_value = "dollars", retrigger_type = "mult", colour = G.C.GOLD },
                { scale = 0.4 }
            },
        }
    end
}