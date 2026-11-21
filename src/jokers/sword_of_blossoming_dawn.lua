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
    remove_from_deck = function(self, card, from_debuff)
        local e = card.ability.extra
        if e.aplicado > 0 then
            G.hand:change_size(-e.aplicado)
            e.aplicado = 0
        end
    end
}

local function num(x)
    if to_number then return to_number(x) end
    return x
end

local ease_dollars_ref = ease_dollars
    function ease_dollars(mod, instant)
        if mod < 0 then
            for _, joker in ipairs(SMODS.find_card('j_tstmod_sword_of_blossoming_dawn')) do
                joker.ability.extra.currentAugment =
                    num(joker.ability.extra.currentAugment or 0) + math.abs(num(mod))
            end
        end
        return ease_dollars_ref(mod, instant)
    end