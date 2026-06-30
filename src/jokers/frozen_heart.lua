SMODS.Joker {
    key = 'frozen_heart',
    atlas = 'league_items',
    pos = {
        x = 2,
        y = 7
    },
    config = {
        extra = {
            chips = 15,
            vouchersBought = 0,
            denominator = 10,
            denominatorIncrease = 2,
            percentage = 10
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local vouchersBought = 0
        local keys_used = {}
        for k, v in ipairs(G.P_CENTER_POOLS["Voucher"]) do
            local key = 1 + math.floor((k-0.1)/2)
            keys_used[key] = keys_used[key] or {}
            if G.GAME.used_vouchers[v.key] then 
            keys_used[key][#keys_used[key]+1] = v
            end
        end
        for k, v in ipairs(keys_used) do 
            if next(v) then
            vouchersBought = vouchersBought + 1
            end
        end
        return {
            vars = {
                card.ability.extra.chips,
                vouchersBought,
                card.ability.extra.denominator,
                card.ability.extra.denominatorIncrease,
                card.ability.extra.percentage
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and context.blind.boss then
            local vouchersBought = 0
            local keys_used = {}
            for k, v in ipairs(G.P_CENTER_POOLS["Voucher"]) do
                local key = 1 + math.floor((k-0.1)/2)
                keys_used[key] = keys_used[key] or {}
                if G.GAME.used_vouchers[v.key] then 
                keys_used[key][#keys_used[key]+1] = v
                end
            end
            for k, v in ipairs(keys_used) do 
                if next(v) then
                vouchersBought = vouchersBought + 1
                end
            end

            local rnd = math.floor(math.random(1, card.ability.extra.denominator)) <= vouchersBought

            if rnd then
                card.ability.extra.denominator = card.ability.extra.denominator + card.ability.extra.denominatorIncrease
                card.ability.extra.chips = card.ability.extra.chips + 15
                
                G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            }))
                return nil, true -- This is for Joker retrigger purposes
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    add_to_deck = function (self, card, context)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.percentage
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function (self, card, context)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.percentage
                for _, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
}