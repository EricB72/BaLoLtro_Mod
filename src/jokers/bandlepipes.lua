SMODS.Joker {
    key = 'bandlepipes',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            numTags = 2,
            numHandSize = 1,
            currentHandSize = 0,
            tags = {'tag_uncommon', 'tag_rare', 'tag_double', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome', 'tag_investment', 'tag_voucher', 'tag_boss', 'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon', 'tag_handy', 'tag_garbage', 'tag_ethereal', 'tag_coupon', 'tag_juggle', 'tag_d_six', 'tag_top_up', 'tag_skip', 'tag_orbital', 'tag_economy'},
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.numTags,
                card.ability.extra.numHandSize,
                card.ability.extra.currentHandSize,
                card.ability.extra.tags
            }
        }
    end,
    calculate = function(self, card, context)
        if G.GAME.blind and ((G.GAME.blind.disabled) and (G.GAME.blind.boss)) and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for i = 1, card.ability.extra.numTags do
                add_tag({ key = card.ability.extra.tags[math.floor(math.random(1, #card.ability.extra.tags))] })
            end

            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'currentHandSize',
                    scalar_value = 'numHandSize'
                }
            )

            G.hand:change_size(card.ability.extra.numHandSize)
        end
    end,
    remove_from_deck = function (self, card, context)
        G.hand:change_size(-card.ability.extra.currentHandSize)
    end
}