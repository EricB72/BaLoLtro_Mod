SMODS.Joker {
    key = 'ardent_censer',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 2
    },
    config = {
        extra = {
            prevHands = 0,
            prevDisc = 0,
            tags = {'tag_uncommon', 'tag_rare', 'tag_double', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome', 'tag_investment', 'tag_voucher', 'tag_boss', 'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon', 'tag_handy', 'tag_garbage', 'tag_ethereal', 'tag_coupon', 'tag_juggle', 'tag_d_six', 'tag_top_up', 'tag_skip', 'tag_orbital', 'tag_economy'},
            rndTag = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.prevHands,
                card.ability.extra.prevDisc,
                card.ability.extra.tags,
                card.ability.extra.rndTag
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.prevHands = G.GAME.current_round.hands_left
            card.ability.extra.prevDisc = G.GAME.current_round.discards_left
        end

        if context.before and not context.discard then
            if G.GAME.current_round.hands_left >= card.ability.extra.prevHands then
                add_tag({ key = card.ability.extra.rndTag })
                card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
            end
        end

        if context.discard and not context.before then
            if G.GAME.current_round.discards_left > card.ability.extra.prevDisc then
                add_tag({ key = card.ability.extra.rndTag })
                card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
            end
        end

        if context.hand_drawn then
            card.ability.extra.prevHands = G.GAME.current_round.hands_left
            card.ability.extra.prevDisc = G.GAME.current_round.discards_left
        end
    end,
    add_to_deck = function (self, card, context)
            card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
            add_tag({ key = card.ability.extra.rndTag })
            card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
    end
}