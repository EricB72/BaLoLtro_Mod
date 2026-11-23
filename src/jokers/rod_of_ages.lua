SMODS.Joker {
    key = 'rod_of_ages',
    atlas = 'league_items_good',
    pos = {
        x = 21,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            chips = 3,
            chipGain = 3,
            dollars = 1,
            maxStacks = 10,
            flush = false
        }
    },
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chipGain,
                card.ability.extra.dollars,
                card.ability.extra.maxStacks,
                card.ability.extra.flush
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        
        if G.GAME.blind and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and not card.ability.extra.flush then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipGain
            if card.ability.extra.chips == 30 then
                card.ability.extra.flush = true
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local prevDollars = card.ability.extra.dollars

        return true and prevDollars or nil
    end
    
}

local function rod_active()
    for _, j in ipairs(SMODS.find_card('j_tstmod_rod_of_ages')) do
        if j.ability.extra and j.ability.extra.flush then
            return true
        end
    end
    return false
end

local function same_enhancement(hand)
    local necesarias = 5 - (next(find_joker('Four Fingers')) and 1 or 0)
    if #hand < necesarias or #hand > 5 then return false end

    local clave
    for _, c in ipairs(hand) do
        local centro = c.config and c.config.center
        if not centro or centro.set ~= 'Enhanced' or c.debuff then
            return false
        end
        if clave and centro.key ~= clave then return false end
        clave = centro.key
    end
    return true
end

local get_flush_ref = get_flush
function get_flush(hand)
    local ret = get_flush_ref(hand)
    if next(ret) then return ret end        -- ya era Color de verdad

    if rod_active() and same_enhancement(hand) then
        local cartas = {}
        for _, c in ipairs(hand) do cartas[#cartas + 1] = c end
        return { cartas }                   -- misma forma que devuelve el juego
    end
    return ret
end