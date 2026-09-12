SMODS.Enhancement {
    key = 'energized',
    atlas = 'other_league',
    object_type = "Enhancement",
    pos = { x = 2, y = 0 },
    config = { 
        chips = 0,
        mult = 2,
        dollars = 0,
        handSize = 0,
        xmult = 0,
        xchips = 0,
        skip = false,

        chipsGain = 0,
        multGain = 2,
        dollarsGain = 0,
        handSizeGain = 0,
        xmultGain = 0,
        xchipsGain = 0
    },
    shatters = false,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.chips,
                card.ability.chipsGain,
                card.ability.mult,
                card.ability.multGain,
                card.ability.dollars,
                card.ability.dollarsGain,
                card.ability.handSize,
                card.ability.handSizeGain,
                card.ability.xmult,
                card.ability.xmultGain,
                card.ability.xchips,
                card.ability.xchipsGain,
                card.ability.skip
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.final_scoring_step then
            card.ability.chips = card.ability.chips + card.ability.chipsGain
            card.ability.mult = card.ability.mult + card.ability.multGain
            card.ability.dollars = card.ability.dollars + card.ability.dollarsGain
            card.ability.handSize = card.ability.handSize + card.ability.handSizeGain
            card.ability.xmult = card.ability.xmult + card.ability.xmultGain
            card.ability.xchips = card.ability.xchips + card.ability.xchipsGain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.trueDMG
            }
        end

        if context.cardarea == G.play and context.individual and context.after then
            if context.other_card == card then
                card.ability.chips = 0
                card.ability.mult = 0
                card.ability.dollars = 0
                card.ability.handSize = 0
                card.ability.xmult = 0
                card.ability.xchips = 0

                return {
                    message = 'Reset'
                }
            end
        end

        if card.ability.skip and context.skip_blind then
            card.ability.chips = card.ability.chips + card.ability.chipsGain
            card.ability.mult = card.ability.mult + card.ability.multGain
            card.ability.dollars = card.ability.dollars + card.ability.dollarsGain
            card.ability.handSize = card.ability.handSize + card.ability.handSizeGain
            card.ability.xmult = card.ability.xmult + card.ability.xmultGain
            card.ability.xchips = card.ability.xchips + card.ability.xchipsGain
        end
    end
}