SMODS.Joker {
    key = 'dad',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            highCard = 'High Card',
            prevHand = 'None',
            triggered = false,
            other_joker = 0
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        return {
            vars = {
                card.ability.extra.highCard,
                card.ability.extra.prevHand,
                card.ability.extra.triggered,
                card.ability.extra.other_joker
            }
        }
    end,
    calculate = function(self, card, context)
        if card.area and card.area == G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.extra.spellblade then card.ability.extra.other_joker = G.jokers.cards[i] end
            end
        end

        if context.joker_main and card.ability.extra.prevHand ~= card.ability.extra.highCard and card.ability.extra.highCard == context.scoring_name then
            if card.ability.extra.other_joker ~= nil then
                return {
                    chips = (card.ability.extra.other_joker).ability.extra.chips,
                    mult = (card.ability.extra.other_joker).ability.extra.mult,
                    xchips = (card.ability.extra.other_joker).ability.extra.chipsMult,
                    xmult = (card.ability.extra.other_joker).ability.extra.multMult,
                    dollars = (card.ability.extra.other_joker).ability.extra.dollars
                }
            end
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_spellblade'), G.C.ORANGE, G.C.WHITE, 1.2 )
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            {
                ref_table = "card.joker_display_values",
                ref_value = "jokerName"
            },
            text = {
                { ref_table = "card.joker_display_values", ref_value = "jokerName" },
            },
            calc_function = function(card)
                local copiedJoker = 'None'

                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability and G.jokers.cards[i].ability.extra and G.jokers.cards[i].ability.extra.spellblade then copiedJoker = G.jokers.cards[i] end
                end


                if copiedJoker ~= 'None' then
                    local jokerName = localize{type = 'name_text', set = 'Joker', key = copiedJoker.config.center.key}
                    card.joker_display_values.jokerName = tostring(jokerName)
                else
                    card.joker_display_values.jokerName = copiedJoker
                end
            end
        }
    end
}