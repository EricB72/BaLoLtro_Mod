SMODS.Joker {
    key = 'bandlepipes',
    atlas = 'league_items_good',
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            numTags = 2,
            numHandSize = 1,
            currentHandSize = 0,
            tags = 0,
            disabled = false,
            nextTag = 'Adress me'
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
                card.ability.extra.tags,
                card.ability.extra.disabled,
                card.ability.extra.nextTag
            }
        }
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.disabled and G.GAME.blind.boss and not card.ability.extra.disabled and (context.hand_drawn or context.end_of_round) and not context.blueprint then
            for i = 1, card.ability.extra.numTags do
                add_tag(card.ability.extra.tags)

                card.ability.extra.tags = get_next_tag_key()
                card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.tags }

                card.ability.extra.tags = Tag(card.ability.extra.tags)
            end

            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'currentHandSize',
                    scalar_value = 'numHandSize'
                }
            )
            
            G.hand:change_size(card.ability.extra.numHandSize)
            
            card.ability.extra.disabled = true
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.disabled = false
        end
    end,
    add_to_deck = function (self, card, context)
        card.ability.extra.tags = get_next_tag_key()
        card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.tags }

        card.ability.extra.tags = Tag(card.ability.extra.tags)    
    end,
    remove_from_deck = function (self, card, context)
        G.hand:change_size(-card.ability.extra.currentHandSize)
    end
}