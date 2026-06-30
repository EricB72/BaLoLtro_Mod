SMODS.Joker {
    key = 'experimental_hexplate',
    atlas = 'league_items',
    pos = {
        x = 4,
        y = 6
    },
    config = {
        extra = {
            highestHand = '',
            rerollAugment = 1,
            handNum = 2,
            freeRerolls = 0,
            planetNominator = 1,
            planetDenominator = 6,
            triggers = 0,
            rerollCount = 0,
            planets = {
                'c_mercury',
                'c_venus',
                'c_earth',
                'c_mars',
                'c_jupiter',
                'c_saturn',
                'c_uranus',
                'c_neptune',
                'c_pluto',
                'c_planet_x',
                'c_ceres',
                'c_eris' }
        }
    },
    rarity = 3,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.highestHand,
                card.ability.extra.rerollAugment,
                card.ability.extra.handNum,
                card.ability.extra.freeRerolls,
                card.ability.extra.planetNominator,
                card.ability.extra.planetDenominator,
                card.ability.extra.triggers,
                card.ability.extra.rerollCount
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.change_free_rerolls(-(card.ability.extra.freeRerolls - card.ability.extra.rerollCount))

            card.ability.extra.freeRerolls = card.ability.extra.freeRerolls - card.ability.extra.rerollCount
            card.ability.extra.rerollCount = 0
        end

        if context.before and not context.blueprint then
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            local highest = true

            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
                    highest = false
                end
            end

            if highest then
                card.ability.extra.highestHand = context.scoring_name
                card.ability.extra.triggers = card.ability.extra.triggers + 1
            end
        end

        if card.ability.extra.triggers >= card.ability.extra.handNum then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'freeRerolls',
                    scalar_value = 'rerollAugment',
                    message_colour = G.C.GREEN
                    }
                )
            
            local rndPlanet = G.P_CENTER_POOLS.Planet[math.floor(math.random(1, #G.P_CENTER_POOLS.Planet))].key
            local goodPlanet = math.floor(math.random(card.ability.extra.planetNominator, card.ability.extra.planetDenominator)) >= 6

            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played and goodPlanet then
                        local _planet = nil
                        for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                            if planet_center.config.hand_type == G.GAME.last_hand_played then
                                _planet = planet_center.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        G.GAME.consumeable_buffer = 0
                    elseif not goodPlanet then
                        SMODS.add_card({ key = rndPlanet })
                    end
                    return true
                end
            }))

            card.ability.extra.triggers = 0
        end

        if G.GAME.blind and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            SMODS.change_free_rerolls(card.ability.extra.freeRerolls)
        end

        if context.reroll_shop and card.ability.extra.rerollCount < card.ability.extra.freeRerolls then
            card.ability.extra.rerollCount = card.ability.extra.rerollCount + 1
        end
    end
}