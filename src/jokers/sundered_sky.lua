SMODS.Joker {
    key = 'sundered_sky',
    atlas = 'league_items_good',
    pos = {
        x = 38,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            crit_chance = 0,
            crit_mult = 0,
            handNum = 0
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.crit_chance,
                card.ability.extra.crit_mult,
                card.ability.extra.handNum
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played == card.ability.extra.handNum then
            card.ability.extra.crit_chance = 100
            card.ability.extra.crit_mult = 0.5
        end

        if context.final_scoring_step and not context.blueprint then
            card.ability.extra.crit_chance = 0
            card.ability.extra.crit_mult = 0
        end
    end
}