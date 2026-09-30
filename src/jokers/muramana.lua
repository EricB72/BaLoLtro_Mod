SMODS.Joker {
    key = 'muramana',
    atlas = 'rare_league_items',
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 69,
        h = 68
    },
    config = {
        extra = {
            mult = 3,
            enhMult = 10,
            chipsGain = 5
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local enh_Cards = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then 
                if G.GAME.current_round.hands_left <= 1 then
                    enh_Cards = enh_Cards + card.ability.extra.enhMult
                else
                    enh_Cards = enh_Cards + card.ability.extra.mult
                end
            end
        end
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.enhMult,
                enh_Cards,
                card.ability.extra.chipsGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local enh_Cards = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if next(SMODS.get_enhancements(playing_card)) then 
                    if G.GAME.current_round.hands_left == 0 then
                        enh_Cards = enh_Cards + card.ability.extra.enhMult
                    else
                        enh_Cards = enh_Cards + card.ability.extra.mult
                    end
                end
            end

            return {
                mult = enh_Cards
            }
        end

        if context.individual and context.cardarea == G.play then
            if next(SMODS.get_enhancements(context.other_card)) then 
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chipsGain

                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
    end,
    in_pool = function(self, args)
        return false
    end
}