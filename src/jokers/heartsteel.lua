SMODS.Joker {
    key = 'heartsteel',
    atlas = 'league_items',
    pos = {
        x = 0,
        y = 8
    },
    config = {
        extra = {
            xmult = 1,
            numHands = 2,
            percent = 10,
            dollars = 0,
            stacks = 0
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
                card.ability.extra.stacks
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[1] and G.GAME.current_round.hands_played == card.ability.extra.numHands then
            card.ability.extra.stacks = card.ability.extra.stacks + tonumber(tostring(G.GAME.dollars)) / card.ability.extra.percent
            card.ability.extra.dollars = card.ability.extra.stacks / card.ability.extra.percent
            card.ability.extra.xmult = 1 + card.ability.extra.stacks / card.ability.extra.percent

            card.ability.extra_value = card.ability.extra.stacks
            card:set_cost()

            local heartsteelName = 'heartsteel' .. tostring(math.floor(math.random(1, 3)))
            G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(card.ability.extra.dollars, card.ability.extra.dollars)
                        --play_sound(heartsteelName)
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
    end
}