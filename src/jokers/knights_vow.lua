SMODS.Joker {
    key = 'knights_vow',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 10
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            owned = false
        }
    },
    rarity = 3,
    cost = 10,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.owned
            }
        }
    end,
    update = function(self, card, context)
        if card.ability.extra.owned then
            local position = 1

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    position = i
                end
            end

            for i = 1, position - 1 do
                G.jokers.cards[i]:remove_sticker('eternal')
            end

            for i = position, #G.jokers.cards do
                G.jokers.cards[i]:add_sticker('eternal', true)
            end
        end
    end,
    add_to_deck = function (self, card)
        card.ability.extra.owned = true
    end,
    remove_from_deck = function (self, card)
        card.ability.extra.owned = false
    end
}