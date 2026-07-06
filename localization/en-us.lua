return {
    descriptions = {
        Joker = {
            j_tstmod_sg = {
                name = 'Sterak\'s Gage',
                text = {
                    {
                    '{C:attention}#3#%{} of base',
                    '{C:chips}Chips{} and {C:mult}Mult{}.'
                },
                {
                    'If remaining {C:chips}Hands{} are equal to {C:attention}#4#{}',
                    'Gives {C:chips}#5#{} Hand/s.',
                    '{C:inactive}(Has a #7# round cooldown){}',
                    '{C:inactive}(Rounds unused: #6#)'
                }
                }
            },
            j_tstmod_tf = {
                name = 'Trinity Force',
                text = {
                        'Spellblade: {C:money}$#1#{}, {X:chips,C:white}X#2#{} Chips',
                        'and {X:mult,C:white}X#3#{} Mult.',
                        '{C:inactive}(Last Hand: #5#)'
                    }
            },
            j_tstmod_dad = {
                name = 'Dusk and Dawn',
                text = {
                    'Copies right-most {C:attention}Spellblade{} effect.'
                }
            },
            j_tstmod_blc = {
                name = 'Bloodletter\'s Curse',
                text = {
                    'For each scored card with a',
                    'different rank on an entire round,',
                    'decrease total score',
                    'required by {X:purple,C:white}#3#%{} up to {X:purple,C:white}#1#%{}.',
                    '{C:inactive}(Current: #2#% -> #4#){}'
                }
            },
            j_tstmod_ymgb = {
                name = 'Youmuu\'s Ghostblade',
                text = {
                    'At the first hand of a',
                    'round gives {C:attention}+#1#{} hand size',
                    'Selling this during a blind,',
                    'gives {C:attention}#2#{} temporal hand size instead.'
                }
            },
            j_tstmod_bork = {
                name = 'Blade of the Ruined King',
                text = {
                    'Gives {X:purple,C:white}#1#%{} of the missing score',
                    'for every {C:attention}King{} scored.'
                }
            },
            j_tstmod_rdc = {
                name = 'Rabadon\'s Deathcap',
                text = {
                    'Gives {X:chips,C:white}X#2#{} Chips and {X:mult,C:white}X#2#{} Mult{}.',
                    'when not playing a {C:attention}#1#{}.'
                }
            },
            j_tstmod_sf = {
                name = 'Shadowflame',
                text = {
                {
                    '{C:mult}Critical Strikes{} caused by',
                    'this Joker affects Enhancements.' 
                },
                    {'If score left is lower than {C:green}#2#%{}.',
                    'Guarantees a {C:mult}Critical Strike',
                    '{C:inactive}(Crit DMG: #6#%)'}
                }
            },
            j_tstmod_hr = {
                name = 'Hollow Radiance',
                text = {
                    {
                        'Gives {C:chips}+#1#{} Chips.'
                    },
                    {
                        'If the first hand played scores',
                        '{C:green}#3#%{} or more of required score,',
                        'gives {X:purple,C:white}#2#%{} of required score as {C:chips}Chips{} instead.'
                    }
                }
            },
            j_tstmod_am = {
                name = 'Abyssal Mask',
                text = {
                    {'Every hand after the',
                    'first one gives {X:chips,C:white}X#1#{}.'
                }
                }
            },
            j_tstmod_act = {
                name = 'Actualizer',
                text = {
                    {
                        '{C:chips}#1#{} Hand'
                    },
                    {
                        'Sell this card to enhance',
                        'every card in you hand,',
                        'selected cards will also',
                        'be granted a seal.'
                    }
                }
            },
            j_tstmod_acs = {
                name = 'Archangel\'s Staff',
                text = {
                    {
                        'Gives {C:chips}+#9#{} Chips, equal to {C:attention}#1#{} times the total',
                        'number of enhanced cards in deck.'
                    },
                    {
                        'Every {C:attention}#2#{} cards scored, enhances',
                        'the {C:attention}#10#{} left-most cards in hand.',
                        '{C:inactive}(Cards scored: #5#)'
                    },
                    {
                        'Transforms into {C:chips}Seraph\'s Embrace{}',
                        'after {C:attention}#3#{} triggers.',
                        '{C:inactive}(Triggers: #6#)'
                    }
                }
            },
            j_tstmod_sebr = {
                name = 'Seraph\'s Embrace',
                text = {
                    {
                        'Gives {C:chips}+#3#{} Chips, equal to {C:attention}#1#{} times',
                        'the total number of enhanced cards in deck.',
                        'If hand played is last hand, gives {C:attention}#2#{} times instead.'
                    }
                }
            },
            j_tstmod_ardent_censer = {
                name = 'Ardent Censer',
                text = {
                    {
                        'Gain a random tag. Additionally gaining a',
                        '{C:chips}Hand{} or a {C:mult}Discard{} grants a random tag.',
                        '{C:inactive}(Activations: #5#){}'
                    }
                }
            },
            j_tstmod_atmas_reckoning = {
                name = 'Atma\'s Reckoning',
                text = {
                    {
                        'Grants {C:green}#2#%{} {C:mult}Critical Chance{}, every {C:money}$#4#{}',
                        'above {C:money}$#6#{} grants another {C:green}1%{}',
                        'up to {C:green}#3#%{}, for a {C:green}50%{} total.',
                        '{C:inactive}(Crit Chance: #8#/#9# (#5#%), Crit DMG: #7#%)'
                    }
                }
            },
            j_tstmod_infinity_edge = {
                name = 'Infinity Edge',
                text = {
                    {
                        'Grants {C:green}#2#%{} {C:mult}Critical Chance{}, and {C:green}#4#% {X:mult,C:white}Critical Damage{}',
                        '{C:inactive}(Crit Chance: #7#/#8# (#3#%), Crit DMG: #6#%)'
                    }
                }
            },
            j_tstmod_essence_reaver = {
                name = 'Essence Reaver',
                text = {
                    {
                        'Grants {C:green}#6#%{} {C:mult}Critical Chance{}.',
                        '{C:inactive}(Crit Chance: #9#/#10# (#7#%), Crit DMG: #8#%)'
                    },
                    {
                        'Spellblade: Grants {C:mult}+#1#{} Mult equal',
                        'to {C:mult}Critical Chance.',
                        'Enhances card played.',
                        '{C:inactive}(Last Hand: #3#)'
                    }
                }
            },
            j_tstmod_axiom_arc = {
                name = 'Axiom Arc',
                text = {
                    {
                        '{C:mult}+#1#{} Mult.',
                    },
                    {
                        'Beating a blind with just {C:attention}#2#{}',
                        'hands, grants {C:green}1/#4#{} luck until',
                        'next beaten {C:attention}Boss Blind{}.',
                        'Additionally, every {C:mult}discard{}',
                        'left at the end of a round',
                        'will increase luck: {C:green}1/#4#-#7#X{}.',
                        'Up to {C:green}1/#8#{}.',
                        '{C:inactive}(Luck: #3#/#6#)'
                    }
                }
            },
            j_tstmod_bandlepipes = {
                name = 'Bandlepipes',
                text = {
                    {
                        'Debuffing a {C:attention}Boss Blind{}',
                        'grants {C:attention}#1#{} random tags and',
                        'gives {C:attention}#2#{} permanent hand size',
                        'at the end of the round.',
                        '{C:inactive}(Hand Size: #3#)'
                    }
                }
            },
            j_tstmod_banshees_veil = {
                name = 'Banshee\'s Veil',
                text = {
                    {
                        '{C:chips}+#1#{} Chips.'
                    },
                    {
                        'Disables next {C:attention}Boss Blind{}.',
                        'Has a {C:attention}#2#{} round cooldown.',
                        'Ending a round with {C:attention}#3#{} hand',
                        'or less restarts the cooldown.',
                        '{C:inactive}(Cooldown: #4#)'
                    }
                }
            },
            j_tstmod_bastionbreaker = {
                name = 'Bastionbreaker',
                text = {
                    {
                        'On boss blind, gives {X:mult,C:white}X#1#{} mult',
                        'equal to the number of jokers.'
                    },
                    {
                        'Skipping directly to a {C:attention}Boss Blind{}',
                        'grants {X:mult,C:white}X#2#{} Mult instead.'
                    }
                }
            },
            j_tstmod_black_cleaver = {
                name = 'Black Cleaver',
                text = {
                    {
                        'Each instance of {X:mult}Mult{}',
                        'during scoring grants a stack.',
                        'Each stack decreases total score',
                        'required by {X:purple,C:white}#1#%{} up to {X:purple,C:white}#2#%.',
                        '{C:inactive}(Current: #4#% -> #7#){}'
                    },
                    {
                        'After reaching max stacks',
                        'this also grants {C:mult}+#3#{} Mult.'
                    }
                }
            },
            j_tstmod_blackfire_torch = {
                name = 'Blackfire Torch',
                text = {
                    {
                        'Each card {C:attention}held in hand',
                        'gives {C:chips}+#1#{} Chips.',
                        'Every activation increases',
                        'chips amount by {C:attention}#2#{}.',
                        '{C:inactive}Resets at the end of the round.{}'
                    }
                }
            },
            j_tstmod_bloodthirster = {
                name = 'Bloodthirster',
                text = {
                    {
                        '{C:mult}+#1#{} Mult.'
                    },
                    {
                        'Getting discards above',
                        'the number of discards',
                        'at the start of a round,',
                        'also grants {C:chips}+#2#{} hand.',
                    },
                    {
                        'Every {C:attention}#3#{} hands played',
                        'grants {C:mult}+#4#{} discard.',
                        '{C:inactive}(Hands played: #6#){}'
                    }
                }
            },
            j_tstmod_chempunk_chainsword = {
                name = 'Chempunk Chainsword',
                text = {
                    {
                        '{C:mult}+#1#{} mult.'
                    },
                    {
                        'If {C:mult}Mult{} is scored,',
                        '{X:purple,C:white}#2#%{} price reduction per',
                        'activation on next shop.',
                        'Up to {X:purple,C:white}#5#%{}.',
                        '{C:inactive}(Price reduction: #6#%){}'
                    }
                }
            },
            j_tstmod_cosmic_drive = {
                name = 'Cosmic Drive',
                text = {
                    {
                        '{C:chips}+#2#{} Chips.'
                    },
                    {
                        'At the {C:attention}end of the round{},',
                        'grants a tag per {X:purple,C:white}#1#%{} blind',
                        'max score reduced.',
                        '{C:inactive}(Reduction: #3#%){}',
                    }
                }
            },
            j_tstmod_cryptbloom = {
                name = 'Cryptbloom',
                text = {
                    {
                        '{C:chips}+#1#{} Chips and {C:mult}+#4#{} discard/s.'
                    },
                    {
                        'Every round gains {C:chips}+#2#{} Chips,',
                        'every boss blind gains {C:mult}+#3#{} discard.',
                    }
                }
            },
            j_tstmod_dawncore = {
                name = 'Dawncore',
                text = {
                    {
                        'Gives {X:chips,C:white}X#1#{} Chips',
                        'per enhanced card in deck.',
                        '{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive} Chips){}'
                    },
                    {
                        'If the {C:attention}entire deck{} is enhanced,',
                        'grants {C:attention}2{} rettrigers to {C:attention}scored hand{}.',
                        '{C:inactive}(Currently #3#/#4#){}'
                    }
                }
            },
            j_tstmod_dead_mans_plate = {
                name = 'Dead Man\'s Plate',
                text = {
                    {
                        '{C:attention}#1#{} free {C:green}Reroll{}.',
                        'per shop.'
                    },
                    {
                        'Every reroll grants {C:mult}+#3#{} Mult,',
                        'every skip grants {C:mult}+#4#{} Mult.',
                        'Resets at the {C:attention}end of the ante{}.',
                        '{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult){}'
                    }
                }
            },
            j_tstmod_heartsteel = {
                name = 'Heartsteel',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Mult, gained',
                        'upon playing the {C:attention}third hand{}.'
                    },
                    {
                        'On the {C:attention}third hand{},',
                        'the {C:attention}first card scored{} gives',
                        '{X:mult,C:white}X#6#{} equal {X:purple,C:white}1%{} of {C:money}Money{}',
                        'and {C:money}$#4#{} equal to {X:purple,C:white}#3#%{} of {X:mult,C:white}XMult{}.',
                        'Gain stacks equal',
                        'to gained {X:mult,C:white}XMult{}.',
                        '{C:inactive}XMult won\'t decrease.{}'
                    },
                    {
                        'Gain {C:attention}sell price{} equal',
                        'to {X:purple,C:white}1%{} the stacks.',
                        '{C:inactive}(Currently #5# stacks){}'
                    }
                }
            },
            j_tstmod_deaths_dance = {
                name = 'Death\'s Dance',
                text = {
                    {
                        '{C:green}Reroll price increase{}',
                        'now happens every {C:attention}#1#{}',
                        'rerolls instead of one.'
                    },
                    {
                        'Each saved {C:moeny}${} on a',
                        '{C:green}Reroll{} grants {C:mult}+1{} Mult.',
                        '{C:inactive}Resets upon entering a shop{}',
                        '{C:inactive}(Currently {C:mult}+#3#{} {C:inactive}Mult){}',
                    }
                }
            },
            j_tstmod_echoes_of_helia = {
                name = 'Echoes of Helia',
                text = {
                    {
                        'Every hand store {X:purple,C:white}#3#%',
                        'of score done.',
                        'Next hand gives',
                        'it as {C:chips}Chips{}.',
                        '{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}',
                        '{C:inactive}Only stores Chips X Mult score.{}'
                    }
                }
            },
            j_tstmod_eclipse = {
                name = 'Eclipse',
                text = {
                    {
                        'Playing your {C:attention}2nd{} most',
                        'played hand and then your',
                        '{C:attention}most{} played hand gives {C:chips}+1{} hand.',
                        '{C:inactive}(1º: #4#, 2º: #5#){}'
                    },
                    {
                        '{C:mult}+Mult{} equal to {C:attention}most{} scored',
                        'hand and {C:attention}2nd{} most times.',
                        '{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult){}'
                    }
                }
            },
            j_tstmod_edge_of_night = {
                name = 'Edge of Night',
                text = {
                    {
                        '{C:mult}+#1#{} Mult, {C:mult}+#2#{} every time a {C:attention}glass',
                        '{C:attention}card{} is played and not broken.',
                        '{C:inactive}Resets upon breaking one.{}'
                    },
                    {
                        'Multiplies probabilities by {C:green}#3#{},',
                        'every time a {C:attention}glass card{} breaks by chance',
                        'this is reduced by a {C:green}#4#%{}.'
                    }
                }
            },
            j_tstmod_endless_hunger = {
                name = 'Endless Hunger',
                text = {
                    {
                        'Gain luck equal to BaseMult / #4#,',
                        'of the played hand.',
                        '{C:inactive}(Current: #3# / #4#){}'
                    },
                    {
                        'After each Boss Blind gain #1#$',
                        'and reduce denominator by',
                        '#2#, up to 1.'

                    }
                }
            },
            j_tstmod_experimental_hexplate = {
                name = 'Experimental Hexplate',
                text = {
                    {
                        'Every #3# highest level hand',
                        'played grants: #2# free reroll',
                        'and a planet card which has',
                        'a #5#/#6# chance of being the played hand card. ',
                        '{C:inactive}(Highest: #1#){}'
                    }
                }
            },
            j_tstmod_fiendhunter_bolts = {
                name = 'Fiendhunter Bolts',
                text = {
                    {
                        '#2#% Crit Chance',
                        '{C:inactive}(Crit Chance: #5#/#6# (#3#%), Crit DMG: #4#%)'
                    },
                    {
                        'Playing you highest level',
                        'hand grants a stack.',
                        'Each stack grants #9# xmult.',
                        '{C:inactive}Resets if not playing your',
                        '{C:inactive}highest level hand.',
                        '{C:inactive}(XMult: #10#){}'
                    },
                    {
                        'XMult given by this joker',
                        'is afected by crits.'
                    }
                }
            },
            j_tstmod_force_of_nature = {
                name = 'Force of Nature',
                text = {
                    {
                        'Rerolling grants a stack,',
                        'buying a booster pack grants',
                        'a stack for each card.',
                        '{C:inactive}(Stacks: #2#){}'
                    },
                    {
                        'For every #6# stacks grants',
                        '#5# Hand Size and #3# chips.',
                        '{C:inactive}Hand size resets upon ending round.'
                    }
                }
            },
            j_tstmod_frozen_heart = {
                name = 'Frozen Heart',
                text = {
                    {
                        '#1# Chips.'
                    },
                    {
                        'Gain a #2#/#3# chance',
                        'of disabling a boss blind.',
                        'If this triggers, increase',
                        'denominator by #4# and chips by 15.',
                        '{C:inactive}Each voucher bought increases',
                        '{C:inactive}numerator by 1.'
                    },
                    {
                        'Reduces voucher prices by #5#%'
                    }
                }
            },
            j_tstmod_guardian_angel = {
                name = 'Guardian Angel',
                text = {
                    {
                        'Upon death, REVIVE and,',
                        'enhance half of your deck',
                        'with glass cards.',
                        '{C:inactive}CAN AFFECT ENHANCED CARDS{}'
                    }
                }
            },
            j_tstmod_guinsoos_rageblade = {
                name = 'Guinsoo\'s Rageblade',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_hexoptics_c44 = {
                name = 'Hexoptics C44',
                text = {
                    {
                        '#1#X Mult, equal to diference ',
                        'between left-most and right-most',
                        'card in hand * #2#.'
                    }
                }
            },
            j_tstmod_hextech_gunblade = {
                name = 'Hextech Gunblade',
                text = {
                    {
                        'Sell this joker to obtain #1#% total',
                        'score, #2# Hand and #3# Discard.'
                    }
                }
            },
            j_tstmod_hextech_rocketbelt = {
                name = 'Hextech Rocketbelt',
                text = {
                    {
                        '+#1# Chips and X#3# Chips',
                        'each skip increase Chips by #2#',
                        'and each other skip increase',
                        'XChips by #4#.'
                    }
                }
            },
            j_tstmod_horizon_focus = {
                name = 'Horizon Focus',
                text = {
                    {
                        '#1#X Chips, equal to diference ',
                        'between left-most and right-most',
                        'card in hand * #2#.'
                    },
                    {
                        'If XChips are 2X or higher, next',
                        'hand will give 2 times the amount.'
                    }
                }
            },
            j_tstmod_hubris = {
                name = 'Hubris',
                text = {
                    {
                        '+#1# Mult, at the end',
                        'of a round gain #1#.',
                        'If it is a boss blind',
                        'gain tiwce the amount.'
                    },
                    {
                        'Skipping blind or rerolling',
                        'boss resets this jokers mult.'
                    }
                }
            },
            j_tstmod_hullbreaker = {
                name = 'Hullbreaker',
                text = {
                    {
                        '+#1# Mult every #3# Hands.',
                        'During a boss blind gives',
                        'X#2# Mult equal to #4#% of Money.'
                    }
                }
            },
            j_tstmod_iceborn_gauntlet = {
                name = 'Iceborn Gauntlet',
                text = {
                    {
                        'Spellblade: #5#/#6# chance of giving',
                        '$#2#, +#1# Chips and disable Boss Blind.'
                    }
                }
            },
            j_tstmod_immortal_shieldbow = {
                name = 'Immortal Shieldbow',
                text = {
                    {
                        '#8#% Crit Chance.'
                    },
                    {
                        '+#1# Mult, equal to',
                        '#4#% of Crit DMG.'
                    },
                    {
                        'Every time you double',
                        'your current score gain',
                        '#2# Discard.',
                        '{C:inactive}(Score: #5#)'
                    }
                }
            },
            j_tstmod_imperial_mandate = {
                name = 'Imperial Mandate',
                text = {
                    {
                        '+#1# Chips, every Boss blind',
                        'disabled grants #2# Chips.'
                    },
                    {
                        'Playing a hand after a discard',
                        'gives #3#% of missing score.',
                        'During a Boss blind gives',
                        'doble the amount instead.'
                    }
                }
            },
            j_tstmod_jaksho_the_protean = {
                name = 'Jak\'Sho, The Protean',
                text = {
                    {
                        'X#1# Chips and X#2# Mult,',
                        'disabling a Boss Blind',
                        'multiplies this by #4#.'
                    }
                }
            },
            j_tstmod_kaenic_rookern = {
                name = 'Kaenic Rookern',
                text = {
                    {
                        'Increase money given',
                        'per hand at the end of',
                        'a round by #1#.'
                    }
                }
            },
            j_tstmod_knights_vow = {
                name = 'Knight\'s Vow',
                text = {
                    {
                        'Jokers to the right obtain',
                        'eternal, the ones on the left',
                        'get eternal removed.',
                        '{C:inactive}Selling this joker keeps',
                        '{C:inactive}things like they are.',
                    }
                }
            },
            j_tstmod_kraken_slayer = {
                name = 'Kraken Slayer',
                text = {
                    {
                        'Each Ace played gives +#1# Chips',
                        'and +#2# Mult, scaling with % of',
                        'total scored done. {C:inactive}(0% - #3#00%)'
                    }
                }
            },
            j_tstmod_liandrys_torment = {
                name = 'Liandry\'s Torment',
                text = {
                     {
                        'Each enhanced card held in hand',
                        'gives #1#% of missing score.'
                    },
                    {
                        'If the card has an edition',
                        'or a seal, gives #2#% instead.'
                    }
                }
            },
            j_tstmod_lich_bane = {
                name = 'Lich Bane',
                text = {
                    {
                        'Spellblade: +#1# Hand Size until',
                        'the end of the round.'
                    }
                }
            },
            j_tstmod_locket_of_the_iron_solari = {
                name = 'Locket of the Iron Solari',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_lord_dominiks_regards = {
                name = 'Lord Dominik\'s Regards',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_ludens_echo = {
                name = 'Luden\'s Echo',
                text = {
                    {
                        'Played bonus cards enhance',
                        'adjacent card as bonus.'
                    },
                    {
                        '+#2# Chips, #3# per each',
                        'bonus card in deck.',
                        '{C:inactive}(Bonus: #4#){}'
                    }
                }
            },
            j_tstmod_malignance = {
                name = 'Malignance',
                text = {
                    {
                        'Bonus card held in hand',
                        'give X#1# Chips.'
                    }
                }
            },
            j_tstmod_manamune = {
                name = 'Manamune',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_muramana = {
                name = 'Muramana',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_maw_of_malmortius = {
                name = 'Maw of Malmortius',
                text = {
                    {
                        '{C:chips}+#1#{} Chips and {C:mult}+#3#{} Mult,',
                        '{C:attention}Boss Blind{} effects increase this',
                        'by {C:chips}+#2#{} and {C:mult}+#4#{}.'
                    }
                }
            },
            j_tstmod_mejais_soulstealer = {
                name = 'Mejai\'s Soulstealer',
                text = {
                    {
                        '{C:attention}#1#{} hand and {C:money}$#3#{} after',
                        'a {C:attention}Boss Blind{}.',
                        '{C:green}Skipping{} a Blind reduces both by {C:attention}2{}.'
                    }
                }
            },
            j_tstmod_mercurial_scimitar = {
                name = 'Mercurial Scimitar',
                text = {
                    {
                        'Eats played {C:purple}Debuffed cards{}',
                        'and gains {C:attention}+#1#{} temporal hand size',
                        'for each debuff eaten.'
                    }
                }
            },
            j_tstmod_mikaels_blessing = {
                name = 'Mikael\'s Blessing',
                text = {
                    {
                        'Sell this joker to {C:purple}Debuff{}',
                        'every card held in hand and',
                        'gain {C:money}$1{} for each.'
                    }
                }
            },
            j_tstmod_moonstone_renewer = {
                name = 'Moonstone Renewer',
                text = {
                    {
                        'Eats enhancements played',
                        'gains {X:mult,C:white}X#2#{} Mult per each.',
                        'Each enhancement in a',
                        'row increases gain by {X:mult,C:white}X#3#{}.',
                        '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
                    }
                }
            },
            j_tstmod_morellonomicon = {
                name = 'Morellonomicon',
                text = {
                    {
                        'Triggers held in hand {C:chips}s{C:purple}e{C:money}a{C:purple}l{C:chips}s{}',
                        'every hand played.'
                    }
                }
            },
            j_tstmod_mortal_reminder = {
                name = 'Mortal Reminder',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_nashors_tooth = {
                name = 'Nashor\'s Tooth',
                text = {
                    {
                        'Each {C:chips}Common{} joker',
                        'gives {C:chips}+#1#{} Chips.'
                    }
                }
            },
            j_tstmod_navori_flickerblade = {
                name = 'Navori Flickerblade',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_overlords_bloodmail = {
                name = 'Overlord\'s Bloodmail',
                text = {
                    {
                        'Gives {X:mult,C:white}X#2#{} Mult per',
                        '{C:money}$1{} of sell value of all jokers.',
                        '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
                    },
                    {
                        'Gives up to {X:purple,C:white}100%{} more',
                        'per scored % amount.',
                        '{C:inactive}(Currently{} {X:purple,C:white}+#3#%{}{C:inactive}){}'
                    }
                }
            },
            j_tstmod_phantom_dancer = {
                name = 'Phantom Dancer',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_profane_hydra = {
                name = 'Profane Hydra',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s will give',
                        '{X:mult,C:white}X#1#{} Mult when scored.',
                        'Each {X:attention,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}1{}.'
                    }
                }
            },
            j_tstmod_protoplasm_harness = {
                name = 'Protoplasm Harness',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_randuins_omen = {
                name = 'Randuin\'s Omen',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_rapid_firecannon = {
                name = 'Rapid Firecannon',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_ravenous_hydra = {
                name = 'Ravenous Hydra',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s will give',
                        '{C:chips}+#1#{} Chips when scored.',
                        'Each {X:attention,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}1{}.',
                    },
                    {
                        'At the end of a round,',
                        'Wild Cards will infect adjacent',
                        'cards and turn them into {C:green}Wild{}.'
                    }
                }
            },
            j_tstmod_redemption = {
                name = 'Redemption',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_riftmaker = {
                name = 'Riftmaker',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_rite_of_ruin = {
                name = 'Rite of Ruin',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_rod_of_ages = {
                name = 'Rod of Ages',
                text = {
                    {
                        'Gives #1# Chips.',
                        'At the end of a round give #3#$.'
                    },
                    {
                        'Every round increase Chips by #2#',
                        'and Dollars by #4#.',
                        'Up to #5# stacks.'
                    },
                    {
                        'At max stacks enhancements',
                        'become suits, you are able',
                        'to play flushes with enhancements.',
                        '#6#'
                    }
                }
            },
            j_tstmod_runaans_hurricane = {
                name = 'Runaan\'s Hurricane',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_rylais_crystal_scepter = {
                name = 'Rylai\'s Crystal Scepter',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_serpents_fang = {
                name = 'Serpent\'s Fang',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_seryldas_grudge = {
                name = 'Serylda\'s Grudge',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_shurelyas_battlesong = {
                name = 'Shurelya\'s Battlesong',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_spear_of_shojin = {
                name = 'Spear of Shojin',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_spectral_cutlass = {
                name = 'Spectral Cutlass',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_spirit_visage = {
                name = 'Spirit Visage',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_staff_of_flowing_water = {
                name = 'Staff of Flowing Water',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_statikk_shiv = {
                name = 'Statikk Shiv',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_stormrazor = {
                name = 'Stormrazor',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_stormsurge = {
                name = 'Stormsurge',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_stridebreaker = {
                name = 'Stridebreaker',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_sundered_sky = {
                name = 'Sundered Sky',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_sunfire_aegis = {
                name = 'Sunfire Aegis',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_sword_of_blossoming_dawn = {
                name = 'Sword of Blossoming Dawn',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_terminus = {
                name = 'Terminus',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_the_collector = {
                name = 'The Collector',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_thornmail = {
                name = 'Thornmail',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_titanic_hydra = {
                name = 'Titanic Hydra',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_umbral_glaive = {
                name = 'Umbral Glaive',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_unending_despair = {
                name = 'Unending Despair',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_void_staff = {
                name = 'Void Staff',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_voltaic_cyclosword = {
                name = 'Voltaic Cyclosword',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_warmogs_armor = {
                name = 'Warmogs Armor',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_whispering_circlet = {
                name = 'Whispering Criclet',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_diadem_of_songs = {
                name = 'Diadem of Songs',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_winters_approach = {
                name = 'Winter\'s Approach',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_fimbulwinter = {
                name = 'Fimbulwinter',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_wits_end = {
                name = 'Wit\'s End',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_yun_tal_wildarrows = {
                name = 'Yun Tal Wildarrows',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_zekes_convergence = {
                name = 'Zeke\'s Convergence',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            },
            j_tstmod_zhonyas_hourglass = {
                name = 'Zhonya\'s Hourglass',
                text = {
                    {
                        'xMult equal to Stacks/10',
                        '{C:inactive}(XMult: #1#){}'
                    },
                    {
                        'At the 3rd hand, activate.',
                        'Gain money equal to 10%',
                        'the stacks.',
                        '{C:inactive}(Stacks: #5#){}'
                    },
                    {
                        'This joker gains sellprice',
                        'equal to its stacks.'
                    }
                }
            }
        },
        Other = {
            m_spellblade = {
                name = "Spellblade",
                text = {
                    'Triggers upon playing',
                'a {C:attention}High Card{} after',
                'any other{C:attention} hand type{}.'
                }
            },
            m_crit = {
                name = "Critical Strike",
                text = {
                    'Multiply whatever card gives',
                    'by Critical Damage.'
                }
            },
            m_energized = {
                name = "Energized",
                text = {
                    'IDK yet.',
                }
            }
        },
        Edition = {
            e_tstmod_spell_shield = {
                name = "Spell Shield",
                text = {
                    "Prevents 1 debuff."
                }
            },
        },
    },
    misc = {
        achievement_names = {
            hidden_achievement = "???",
        },
        achievement_descriptions = {
            hidden_achievement = "Play more to find out!",
        },
        dictionary = {
            lol_crit = 'CRIT!!',
            b_spellblade = 'Spellblade',
            b_crit = 'Critical',
            b_energize = 'Energize',
            k_bonus = 'Bonus',
            k_enhanced = 'Enhanced',
            k_infected = 'Infected',
            a_hand = 'Hand',
            a_active = 'Active'
		},
        labels = {
            tstmod_spell_shield = 'Spell Shield'
        }
	},
}