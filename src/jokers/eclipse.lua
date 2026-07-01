SMODS.Joker {
    key = 'eclipse',
    atlas = 'league_items',
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            prevHand = false,
            handsAmount = 0,
            hands = 1,
            mostPlayed = '',
            secondPlayed = ''
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.prevHand,
                card.ability.extra.handsAmount,
                card.ability.extra.hands,
                card.ability.extra.mostPlayed,
                card.ability.extra.secondPlayed
            }
        }
    end,
    calculate = function(self, card, context)
        if context.hand_drawn then
            local eval = function() return card.ability.extra.prevHand end
            juice_card_until(card, eval, true)
        end

        if context.before and not context.blueprint then
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            local highest = true

            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
                    highest = false
                end
            end

            if highest then
                if card.ability.extra.prevHand then
                    card.ability.extra.handsAmount = card.ability.extra.handsAmount + G.GAME.hands[context.scoring_name].played
                end
                
                card.ability.extra.mostPlayed = context.scoring_name
            else
                highest = true

                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.mostPlayed then
                        highest = false
                    end
                end

                if highest then
                    card.ability.extra.secondPlayed = context.scoring_name
                    card.ability.extra.prevHand = true
                    card.ability.extra.handsAmount = card.ability.extra.handsAmount + G.GAME.hands[context.scoring_name].played
                end
            end
        end

        if context.joker_main then
            if card.ability.extra.prevHand and context.scoring_name == card.ability.extra.mostPlayed then
                ease_hands_played(card.ability.extra.hands)
                card.ability.extra.prevHand = false

                return {
                    mult = card.ability.extra.handsAmount
                }
            end
        end
    end
}