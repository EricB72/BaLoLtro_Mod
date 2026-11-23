SMODS.Joker {
    key = 'thornmail',
    atlas = 'league_items_good',
    pos = {
        x = 43,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            dollars = 1,
            chips = 20
        }
    },
    rarity = 2,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local n = 0
            for _, c in ipairs(context.scoring_hand) do
                if c.debuff then n = n + 1 end
            end
            if n > 0 then
                return {
                    chips = n * card.ability.extra.chips,
                    dollars = n * card.ability.extra.dollars            
                }
            end
            
        end
    end
}