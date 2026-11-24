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
            dollars = 0.2,
            chips = 20,
            currDollars = 0.2,
            currChips = 20
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.chips,
                card.ability.extra.currDollars,
                card.ability.extra.currChips
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
                card.ability.extra.currDollars = card.ability.extra.currDollars + n * card.ability.extra.dollars
                card.ability.extra.currChips = card.ability.extra.currChips + n * card.ability.extra.chips
                
                return {
                    chips = card.ability.extra.currChips,
                    dollars = card.ability.extra.currDollars
                }
            end
            
        end
    end
}