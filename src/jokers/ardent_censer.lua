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
            rndTag = 0,
            tagsGiven = 1,
            nextTag = 'IDK'        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rndTag,
                card.ability.extra.tagsGiven,
                card.ability.extra.nextTag
            }
        }
    end,
    calculate = function(self, card, context)
        if context.tstmod_hand_gained or context.tstmod_discard_gained and not context.blueprint then
            add_tag(card.ability.extra.rndTag)

            card.ability.extra.rndTag = get_next_tag_key()
            card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.rndTag }

            card.ability.extra.rndTag = Tag(card.ability.extra.rndTag)
        end
    end,
    add_to_deck = function (self, card, context)
			card.ability.extra.rndTag = Tag(get_next_tag_key())
            add_tag(card.ability.extra.rndTag)

            card.ability.extra.rndTag = get_next_tag_key()
            card.ability.extra.nextTag = localize { type = 'name_text', set = 'Tag', key = card.ability.extra.rndTag }

            card.ability.extra.rndTag = Tag(card.ability.extra.rndTag)
    end
}