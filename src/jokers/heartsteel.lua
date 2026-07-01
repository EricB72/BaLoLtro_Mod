SMODS.Joker {
    key = 'heartsteel',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            xmult = 1,
            numHands = 2,
            percent = 20,
            dollars = 0,
            stacks = 0,
            xmultJoker = 1
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.numHands,
                card.ability.extra.percent,
                card.ability.extra.dollars,
                card.ability.extra.stacks,
                card.ability.extra.xmultJoker,
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.extra.xmult = 1 + card.ability.extra.stacks / 100
        card.ability.extra.dollars = math.floor((card.ability.extra.xmult) * card.ability.extra.percent / 100 * 100) / 100

        card.ability.extra.xmultJoker = tonumber(tostring(1 + G.GAME.dollars / 100))

        if ((card.ability.extra.xmultJoker - 1) * 100) < card.ability.extra.stacks then
            card.ability.extra.xmultJoker = card.ability.extra.stacks / 100 + 1
        end

        if  G.GAME.current_round.hands_played == card.ability.extra.numHands and context.hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == card.ability.extra.numHands end
            
            juice_card_until(card, eval, true)
        end

        if context.before then
            card.ability.extra.dollars = 0
        end

        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[1] and G.GAME.current_round.hands_played == card.ability.extra.numHands then
            card.ability.extra.xmult = card.ability.extra.xmultJoker

            if ((card.ability.extra.xmult - 1) * 100) < card.ability.extra.stacks then
                card.ability.extra.xmult = 1 + card.ability.extra.stacks / 100
            end

            card.ability.extra.dollars = math.floor((card.ability.extra.xmult) * card.ability.extra.percent / 100 * 100) / 100 -- 2 decimals

            card.ability.extra.stacks =  math.floor((card.ability.extra.xmult - 1) * 100)

            card.ability.extra_value = card.ability.extra_value + card.ability.extra.stacks / 100
            card:set_cost(card.ability.extra_value)

            local heartsteelName = 'tstmod_heartsteel_' .. tostring(math.floor(math.random(1, 3)))
            local pitch = 1
            local volume = 1

            G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(card.ability.extra.stacks / 100, card.ability.extra.stacks / 100)
                        play_sound(heartsteelName, pitch, volume)
                        return {
                            true
                        }
                    end
                }))
            return {
                xmult = card.ability.extra.xmult,
                dollars = card.ability.extra.dollars,
                message_card = card
            }
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    SMODS.Sound{ key = 'heartsteel_1', path = 'Heartsteel_trigger_SFX_1.ogg'},
    SMODS.Sound{ key = 'heartsteel_2', path = 'Heartsteel_trigger_SFX_2.ogg'},
    SMODS.Sound{ key = 'heartsteel_3', path = 'Heartsteel_trigger_SFX_3.ogg'},
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "x_mult"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "dollars"
            },
            {
                ref_table = "card.joker_display_values",
                ref_value = "left_Hands"
            },
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            },
            { text = ", +$", colour = G.C.GOLD },
            { ref_table = "card.joker_display_values", ref_value = "dollars", colour = G.C.GOLD },
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "left_Hands", colour = G.C.BLUE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            local rettr = 0
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    rettr = rettr + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    break
                end
            end
            if text ~= 'Unknown' and G.GAME.current_round.hands_played == card.ability.extra.numHands then
                card.joker_display_values.x_mult = card.ability.extra.xmultJoker ^ rettr
                card.joker_display_values.dollars = card.ability.extra.dollars * rettr
                card.joker_display_values.left_Hands = 'Active'
            else
                card.joker_display_values.x_mult = card.ability.extra.xmult
                card.joker_display_values.dollars = 0
                card.joker_display_values.left_Hands = 'Inactive'
            end
        end
    }
    end
}