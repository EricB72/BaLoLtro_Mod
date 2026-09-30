SMODS.Joker {
    key = 'ardent_censer',
    atlas = 'league_items_good',
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            prevHands = 4,
            prevDisc = 4,
            tags = {'tag_uncommon', 'tag_rare', 'tag_double', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome', 'tag_investment', 'tag_voucher', 'tag_boss', 'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon', 'tag_handy', 'tag_garbage', 'tag_ethereal', 'tag_coupon', 'tag_juggle', 'tag_d_six', 'tag_top_up', 'tag_skip', 'tag_orbital', 'tag_economy'},
            rndTag = 0,
            activations = 0,
            tagsGiven = 1,
            nextTag = 'IDK',
            inBlind = false
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.prevHands,
                card.ability.extra.prevDisc,
                card.ability.extra.tags,
                card.ability.extra.rndTag,
                card.ability.extra.activations,
                card.ability.extra.tagsGiven,
                card.ability.extra.nextTag,
                card.ability.extra.inBlind
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.setting_blind or context.before or context.hand_drawn) and not context.blueprint then
            card.ability.extra.prevHands = G.GAME.current_round.hands_left
            card.ability.extra.prevDisc = G.GAME.current_round.discards_left

            card.ability.extra.inBlind = true
        end

        if G.GAME.blind and G.GAME.current_round.hands_left > card.ability.extra.prevHands and card.ability.extra.inBlind then
            for i = 1, G.GAME.current_round.hands_left - card.ability.extra.prevHands, 1 do
                card.ability.extra.activations = card.ability.extra.activations + 1
            end

            card.ability.extra.prevHands = G.GAME.current_round.hands_left
        end

        if G.GAME.blind and G.GAME.current_round.discards_left > card.ability.extra.prevDisc and card.ability.extra.inBlind then
            for i = 1, G.GAME.current_round.discards_left - card.ability.extra.prevDisc, 1 do
                card.ability.extra.activations = card.ability.extra.activations + 1
            end

            card.ability.extra.prevDisc = G.GAME.current_round.discards_left
        end

        if (context.hand_drawn or context.end_of_round) and not context.blueprint then
            for i = 1, card.ability.extra.activations, 1 do
                add_tag({ key = card.ability.extra.rndTag })
                card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
                card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.rndTag }
            end

            card.ability.extra.activations = 0
        end

        if context.end_of_round and not context.blueprint then
            card.ability.extra.inBlind = false
        end
    end,
    add_to_deck = function (self, card, context)
            card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
            add_tag({ key = card.ability.extra.rndTag })
            card.ability.extra.rndTag = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))]
            card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.rndTag }
    end
}