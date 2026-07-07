SMODS.Joker {
    key = 'talisman_of_ascension',
    atlas = 'legendary_league_items',
    pos = {
        x = 2,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 79,
        h = 78
    },
    config = {
        extra = {
            points = 0,
            chips = 0,
            xchips = 1,
            mult = 0,
            xmult = 1,
            dollars = 0,
            hands = 0,
            discards = 0,
            handSize = 0,
            chipsPerPoint = 4,
            xchipsPerPoint = 0.15,
            multPerPoint = 2,
            xmultPerPoint = 0.25,
            dollarsPerPoint = 0.1,
            handsPerPoint = 0.075,
            discardsPerPoint = 0.075,
            handSizePerPoint = 0.05,

        }
    },
    rarity = 4,
    cost = 11,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.points,
                card.ability.extra.chips,
                card.ability.extra.xchips,
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.dollars,
                card.ability.extra.hands,
                card.ability.extra.discards,
                card.ability.extra.handSize,
                card.ability.extra.chipsPerPoint,
                card.ability.extra.xchipsPerPoint,
                card.ability.extra.multPerPoint,
                card.ability.extra.xmultPerPoint,
                card.ability.extra.dollarsPerPoint,
                card.ability.extra.handsPerPoint,
                card.ability.extra.discardsPerPoint,
                card.ability.extra.handSizePerPoint,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - math.floor(card.ability.extra.hands)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - math.floor(card.ability.extra.discards)
            G.hand:change_size(-math.floor(card.ability.extra.handSize))

            card.ability.extra.points = card.ability.extra.points + 1

            local table = {0, 0, 0, 0, 0, 0, 0, 0}

            for i = 1, card.ability.extra.points do
                local rnd = math.random(1, 8)
                table[rnd] = table[rnd] + 1

                card.ability.extra.chips = table[1] * card.ability.extra.chipsPerPoint
                card.ability.extra.mult = table[2] * card.ability.extra.multPerPoint
                card.ability.extra.xchips = 1 + table[3] * card.ability.extra.xchipsPerPoint
                card.ability.extra.xmult = 1 + table[4] * card.ability.extra.xmultPerPoint
                card.ability.extra.dollars = table[5] * card.ability.extra.dollarsPerPoint
                card.ability.extra.hands = table[6] * card.ability.extra.handsPerPoint
                card.ability.extra.discards = table[7] * card.ability.extra.discardsPerPoint
                card.ability.extra.handSize = table[8] * card.ability.extra.handSizePerPoint
            end

            G.GAME.round_resets.hands = G.GAME.round_resets.hands + math.floor(card.ability.extra.hands)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + math.floor(card.ability.extra.discards)
            G.hand:change_size(math.floor(card.ability.extra.handSize))
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult,
                dollars = card.ability.extra.dollars
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            extra =
            {
                {
                    { text = '+', colour = G.C.MULT },
                    { ref_table = "card.ability.extra", ref_value = "discards", colour = G.C.MULT },
                    { text = ', '},
                    { text = '+', colour = G.C.MONEY},
                    { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.MONEY },
                },
                
                {
                    { text = '$', colour = G.C.MONEY },
                    { ref_table = "card.ability.extra", ref_value = "dollars", retrigger_type = "mult", colour = G.C.MONEY },
                    { text = ', '},
                    { text = '+', colour = G.C.CHIPS},
                    { ref_table = "card.ability.extra", ref_value = "hands", colour = G.C.CHIPS },
                },

                {
                    {
                        border_nodes = {
                            { text = "X" },
                            { ref_table = "card.ability.extra", ref_value = "xchips", retrigger_type = "exp", border_colour = G.C.CHIPS }
                        },
                        border_colour = G.C.CHIPS
                    },
                    { text = ', '},
                    {
                        border_nodes = {
                            { text = "X" },
                            { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                        }
                    }
                },

                {
                    { text = '+', colour = G.C.CHIPS},
                    { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
                    { text = ', '},
                    { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra", ref_value = "points", colour = G.C.WHITE },
                { text = " points)" }
            }
        }
    end
}