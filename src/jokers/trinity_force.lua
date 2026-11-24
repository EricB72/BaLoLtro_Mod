SMODS.Joker {
    key = 'tf',
    atlas = 'league_items_good',
    pos = {
        x = 45,
        y = 1
    },
    display_size = {
        w = 68,
        h = 68
    },
    config = {
        extra = {
            dollars = 3.33,
            chipsMult = 3.33,
            multMult = 3.33,
            spellblade = true
        }
    },
    rarity = 3,
    cost = 9.99,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_spellblade' }
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.chipsMult,
                card.ability.extra.multMult,
                card.ability.extra.spellblade
            }
        }
    end,
    calculate = function(self, card, context)
        if context.tstmod_spellblade then
            card.ability.extra.spellblade = true
        end

        --Spellblade
        if card.ability.extra.spellblade and context.individual and context.cardarea == G.play then
            if context.other_card:get_id() and context.other_card:get_id() == 3 then
                return {
                    xchips = card.ability.extra.chipsMult,
                    xmult = card.ability.extra.multMult,
                    dollars = card.ability.extra.dollars
                }
            end
        end

        if context.after and not context.blueprint then
            card.ability.extra.spellblade = false
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('b_spellblade'), G.C.ORANGE, G.C.WHITE, 1.2 )
    end
}

local function num(x) if to_number then return to_number(x) end return x end

function tstmod_stat_total(campo, base)
    local total = base
    if G.jokers then
        for _, j in ipairs(G.jokers.cards) do
            local e = j.ability and j.ability.extra
            if not j.debuff and type(e) == 'table' and e[campo] ~= nil then
                total = total + num(e[campo])
            end
        end
    end
    return total
end

function tstmod_crit_percent(objeto, campo)
    campo = campo or 'crit_chance'
    local total = tstmod_stat_total(campo, 0)
    local id = (campo == 'crit_chance') and 'tstmod_crit' or 'tstmod_ecrit'
    local num, den = SMODS.get_probability_vars(objeto, total, 100, id)
    return num / den * 100
end

function tstmod_crit_x() --Multiply crit dmg
    local total = 1
    if G.jokers then
        for _, j in ipairs(G.jokers.cards) do
            local f = j.config.center.crit_x
            if f and not j.debuff then
                total = total * num(f(j.config.center, j))
            end
        end
    end
    return total
end

local function tirar(carta, campo, semilla)
    local prob = tstmod_stat_total(campo, 0)
    return prob > 0 and SMODS.pseudorandom_probability(carta, semilla, prob, 100, semilla)
end

local function crit_dmg()
    return tstmod_stat_total('crit_mult', 175) / 100 * tstmod_crit_x()
end


local function efecto_mejora(carta, d)
    local centro = carta.config and carta.config.center
    if not centro or centro.set ~= 'Enhanced' then return nil end
    if centro.key == 'm_lucky' then return nil end   -- sus efectos son probabilísticos

    local a = carta.ability
    local function v(x) return num(x or 0) end
    local e = {}

    if v(a.bonus)    ~= 0 then e.chips  = v(a.bonus) * d end
    if v(a.mult)     ~= 0 then e.mult   = v(a.mult) * d end
    if v(a.x_mult)   >  1 then e.xmult  = v(a.x_mult) * d end
    if v(a.x_chips)  >  1 then e.xchips = v(a.x_chips) * d end
    if v(a.p_dollars) ~= 0 then e.dollars = math.floor(v(a.p_dollars) * d + 0.5) end

    return next(e) and e or nil
end

--Gain Hand/Discard
local en_curso = false   -- evita bucles si un joker reacciona dando más manos

-- Ganar manos
local ease_hands_ref = ease_hands_played
function ease_hands_played(mod, instant)
    local ret = ease_hands_ref(mod, instant)
    if num(mod) > 0 and not en_curso then
        en_curso = true
        SMODS.calculate_context({ tstmod_hand_gained= true, cantidad = num(mod) })
        en_curso = false
    end
    return ret
end

-- Ganar descartes
local ease_discard_ref = ease_discard
function ease_discard(mod, instant, silent)
    local ret = ease_discard_ref(mod, instant, silent)
    if num(mod) > 0 and not en_curso then
        en_curso = true
        SMODS.calculate_context({ tstmod_discard_gained = true, cantidad = num(mod) })
        en_curso = false
    end
    return ret
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

SMODS.current_mod.calculate = function(self, context)
    --Spellblade
    if context.before then
        local actual = context.scoring_name
        local previa = G.GAME.tstmod_last_hand

        if previa and previa ~= 'High Card' and actual == 'High Card' then
            SMODS.calculate_context({
                tstmod_spellblade = true,
                last_hand = previa,
            })
        end

        G.GAME.tstmod_last_hand = actual
    end

    --Crit
    if context.individual and context.cardarea == G.play then
    local carta = context.other_card
    if carta and not carta.debuff then
        local d = crit_dmg()

        -- Crítico normal: Mult = chips de la carta × daño
        if tirar(carta, 'crit_chance', 'tstmod_crit') then
            local mult = carta:get_chip_bonus() * d
            if mult > 0 then
                SMODS.calculate_effect(
                    { mult = mult, message = localize('b_crit'), colour = G.C.MULT }, carta)
            end
        end

        -- Crítico mejorado: lo que da la mejora, del mismo tipo, × daño
        if tirar(carta, 'ecrit_chance', 'tstmod_ecrit') then
            local ef = efecto_mejora(carta, d)
            if ef then
                ef.message = localize('b_crit')
                SMODS.calculate_effect(ef, carta)
            end
        end
    end
end

end