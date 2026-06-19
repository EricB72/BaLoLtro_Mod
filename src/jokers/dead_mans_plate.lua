SMODS.Joker {
    key = 'dead_mans_plate',
    atlas = 'league_items',
    pos = {
        x = 3,
        y = 5
    },
    config = {
        extra = {
            freeRerolls = 1,
            mult = 0,
            multGain = 5,
            skipGain = 20
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.freeRerolls,
                card.ability.extra.mult,
                card.ability.extra.multGain,
                card.ability.extra.skipGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multGain
        end

        if context.skip_blind and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.skipGain
        end
        
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.end_of_round and G.GAME.blind.boss then
            card.ability.extra.mult = 0
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.freeRerolls)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.freeRerolls)
    end
}