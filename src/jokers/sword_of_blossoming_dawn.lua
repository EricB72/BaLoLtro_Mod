SMODS.Joker {
    key = 'sword_of_blossoming_dawn',
    atlas = 'league_items_good',
    pos = {
        x = 40,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            everyX = 10,
            handSize = 1,
            currentAugment = 0,
            augmentApplied = 0
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.everyX,
                card.ability.extra.handSize,
                card.ability.extra.currentAugment,
                card.ability.extra.augmentApplied
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local bonus = math.floor(card.ability.extra.currentAugment / card.ability.extra.everyX)
            bonus = math.min(bonus, 20)   -- tope para no romper la mano
            if bonus > 0 then
                G.hand:change_size(bonus)
                card.ability.extra.augmentApplied = bonus
                card.ability.extra.currentAugment = card.ability.extra.currentAugment - card.ability.extra.everyX * bonus
            end
        end

        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            if card.ability.extra.augmentApplied > 0 then
                G.hand:change_size(-card.ability.extra.augmentApplied)
                card.ability.extra.augmentApplied = 0
            end
        end
    end,
    remove_from_deck = function(self, card)
        local e = card.ability.extra
        if e and e.aplicado and e.aplicado > 0 then
            G.hand:change_size(-e.aplicado)
            e.aplicado = 0
        end
    end
}
