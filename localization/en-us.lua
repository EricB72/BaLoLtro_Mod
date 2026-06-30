return {
    descriptions = {
        Joker = {
            j_tstmod_sg = {
                name = 'Sterak\'s Gage',
                text = {
                    {
                    'Gives and additional {C:attention}#3#%{}',
                    'of base {C:chips}Chips{} and {C:mult}Mult{}.'
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
                        'When playing a {C:attention}#4#{} after any other hand,',
                        '{C:money}$#1#{}, {X:chips,C:white}X#2#{} Chips and {X:mult,C:white}X#3#{} Mult.',
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
                    'required by #3#% up to #1#%.',
                    '{C:inactive}(Current: #2#% -> #4#){}'
                }
            },
            j_tstmod_ymgb = {
                name = 'Youmuu\'s Ghostblade',
                text = {
                    'At the first hand of a round gives +#1# Hand Size',
                    'Selling this during a blind, gives #2# temporal Hand Size instead.'
                }
            },
            j_tstmod_bork = {
                name = 'Blade of the Ruined King',
                text = {
                    'Gives {C:attention}#1#%{} of the missing score',
                    'for every King scored.',
                    'Every #2# tiggers grants',
                    'a #6#% instead.',
                    '{C:inactive}(Triggers: #3#)'
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
                    {'Critical Strikes caused by',
                    'this Joker affects Enhancements.' },

                    {'If score left is lower than {C:attention}#2#%{}.',
                    'Guarantees a Critical Strike',
                    '{C:inactive}(Crit DMG: #6#%)'}
                }
            },
            j_tstmod_hr = {
                name = 'Hollow Radiance',
                text = {
                    {'Gives #1# {C:chips}Chips{}.'},
                    {
                        'If the first hand played scores #3#% or more of required score,',
                        'gives #2#% of required score as {C:chips}Chips{} instead.'
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
                        '-1 Hand'
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
                        'Gives {C:chips}#9#{} Chips, equal to #1# times the total',
                        'number of enhanced cards in deck.'
                    },
                    {
                        'Every #2# cards scored, enhances',
                        'the #10# left-most cards in hand.',
                        '{C:inactive}(Cards scored: #5#)'
                    },
                    {
                        'Transforms into {C:chips}Seraph\'s Embrace{}',
                        'after #3# triggers.',
                        '{C:inactive}(Triggers: #6#)'
                    }
                }
            },
            j_tstmod_sebr = {
                name = 'Seraph\'s Embrace',
                text = {
                    {
                        'Gives {C:chips}#3#{} Chips, equal to #1# times',
                        'the total number of enhanced cards in deck.',
                        'If hand played is last hand, gives #2# times instead.'
                    }
                }
            },
            j_tstmod_ardent_censer = {
                name = 'Ardent Censer',
                text = {
                    {
                        'Gain a random tag. Additionally gaining a',
                        'hand or a discard grants a random tag.',
                        '{C:inactive}(Activations: #5#){}'
                    }
                }
            },
            j_tstmod_atmas_reckoning = {
                name = 'Atma\'s Reckoning',
                text = {
                    {
                        'Grants #2#% Critical Chance, every #4#$ above #6#$ grants another 1%',
                        'up to #3#%, for a 50% total.',
                        '{C:inactive}(Crit Chance: #8#/#9# (#5#%), Crit DMG: #7#%)'
                    }
                }
            },
            j_tstmod_infinity_edge = {
                name = 'Infinity Edge',
                text = {
                    {
                        'Grants #2#% Critical Chance, and #4#% Critical Damage',
                        '{C:inactive}(Crit Chance: #7#/#8# (#3#%), Crit DMG: #6#%)'
                    }
                }
            },
            j_tstmod_essence_reaver = {
                name = 'Essence Reaver',
                text = {
                    {
                        'Grants #6#% Critical Chance.',
                        '{C:inactive}(Crit Chance: #9#/#10# (#7#%), Crit DMG: #8#%)'
                    },
                    {
                        'Spellblade: Grants {C:mult}#1#{} Mult equal',
                        'to Critical Chance.',
                        'Enhances card played.',
                        '{C:inactive}(Last Hand: #3#)'
                    }
                }
            },
            j_tstmod_axiom_arc = {
                name = 'Axiom Arc',
                text = {
                    {
                        '{C:mult}#1#{} Mult.',
                    },
                    {
                        'Beating a blind with just #2#',
                        'hands, grants 1/#4# luck until',
                        'next beaten boss blind.',
                        'Additionally, every discard',
                        'left at the end of a round',
                        'will increase luck: 1/#4#-#7#X.',
                        'Up to 1/#8#.',
                        '{C:inactive}(Luck: #3#/#6#)'
                    }
                }
            },
            j_tstmod_bandlepipes = {
                name = 'Bandlepipes',
                text = {
                    {
                        'Debuffing a boss blind',
                        'grants #1# random tags and',
                        'gives #2# permanent Hand Size',
                        'at the end of the round.',
                        '{C:inactive}(Hand Size: #3#)'
                    }
                }
            },
            j_tstmod_banshees_veil = {
                name = 'Banshee\'s Veil',
                text = {
                    {
                        '#1# Chips.'
                    },
                    {
                        'Disables next boss blind.',
                        'Has a #2# round cooldown.',
                        'Ending a round with #3# hand',
                        'or less restarts the cooldown.',
                        '{C:inactive}(Cooldown: #4#)'
                    }
                }
            },
            j_tstmod_bastionbreaker = {
                name = 'Bastionbreaker',
                text = {
                    {
                        'On boss blind, gives #1#X mult',
                        'equal to the number of jokers.'
                    },
                    {
                        'Skipping directly to a Boss Blind',
                        'grants #2#X mult instead.'
                    }
                }
            },
            j_tstmod_black_cleaver = {
                name = 'Black Cleaver',
                text = {
                    {
                        'Each instance of +Mult',
                        'during scoring grants a stack.',
                        'Each stack decreases total score',
                        'required by #1#% up to #2#%.',
                        '{C:inactive}(Current: #4#% -> #7#){}'
                    },
                    {
                        'After reaching max stacks',
                        'this also grants #3# mult.'
                    }
                }
            },
            j_tstmod_blackfire_torch = {
                name = 'Blackfire Torch',
                text = {
                    {
                        'Each card held in hand',
                        'gives #1# chips.',
                        'Every activation increases',
                        'chips amount by #2#.',
                        '{C:inactive}Resets at the end of the round.{}'
                    }
                }
            },
            j_tstmod_bloodthirster = {
                name = 'Bloodthirster',
                text = {
                    {
                        '#1# mult.'
                    },
                    {
                        'Getting discards above',
                        'the number of discards',
                        'at the start of a round,',
                        'also grants #2# Hand.',
                    },
                    {
                        'Every #3# hands played',
                        'grants #4# discard.',
                        '{C:inactive}(Hands played: #6#){}'
                    }
                }
            },
            j_tstmod_chempunk_chainsword = {
                name = 'Chempunk Chainsword',
                text = {
                    {
                        '#1# mult.'
                    },
                    {
                        'If a Mult is scored,',
                        '#2#% price reduction per',
                        'activation on next shop.',
                        'Up to #5#%.',
                        '{C:inactive}(Price reduction: #6#%){}'
                    }
                }
            },
            j_tstmod_cosmic_drive = {
                name = 'Cosmic Drive',
                text = {
                    {
                        '#2# Chips.'
                    },
                    {
                        'At the end of the round,',
                        'grants a tag per #1#% blind',
                        'max score reduced.',
                        '{C:inactive}(Reduction: #3#%){}',
                    }
                }
            },
            j_tstmod_cryptbloom = {
                name = 'Cryptbloom',
                text = {
                    {
                        '#1# Chips and #4# discard/s.'
                    },
                    {
                        'Every round gains #2# chips,',
                        'every boss blind gains #3# discard.',
                    }
                }
            },
            j_tstmod_dawncore = {
                name = 'Dawncore',
                text = {
                    {
                        'Gives #2# XChips',
                        'per enhanced',
                        'card in deck.',
                        '{C:inactive}(XChips: #1#){}'
                    },
                    {
                        'If the entire deck is enhanced,',
                        'grants 2 rettrigers to scored hand.',
                        '{C:inactive}(Enh. cards: #3#/#4#){}'
                    }
                }
            },
            j_tstmod_dead_mans_plate = {
                name = 'Dead Man\'s Plate',
                text = {
                    {
                        'Gives #1# free reroll.'
                    },
                    {
                        'Every reroll grants #3# Mult,',
                        'every skip grants #4# Mult.',
                        'Resets at the end of the ante.',
                        '{C:inactive}(Mult: #2#){}'
                    }
                }
            },
            j_tstmod_heartsteel = {
                name = 'Heartsteel',
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
            j_tstmod_deaths_dance = {
                name = 'Death\'s Dance',
                text = {
                    {
                        'Reroll price increase',
                        'now happens every #1#',
                        'rerolls instead of one.'
                    },
                    {
                        'Each saved $ during a',
                        'reroll grants +1 Mult.',
                        '{C:inactive}Resets upon entering a shop{}',
                        '{C:inactive}(Mult: #3#){}',
                    }
                }
            },
            j_tstmod_echoes_of_helia = {
                name = 'Echoes of Helia',
                text = {
                    {
                        'Every hand store #3#%',
                        'of score done.',
                        'Next hand gives',
                        'it as Chips.',
                        '{C:inactive}(Chips: #1#){}'
                    }
                }
            },
            j_tstmod_eclipse = {
                name = 'Eclipse',
                text = {
                    {
                        'Playing your 2nd most',
                        'played hand and then your',
                        'most played hand gives a Hand.',
                        '{C:inactive}(1º: #4#, 2º: #5#){}'
                    },
                    {
                        '+Mult equal to most scored',
                        'hand and 2nd most times.',
                        '{C:inactive}(Mult: #2#){}'
                    }
                }
            },
            j_tstmod_edge_of_night = {
                name = 'Edge of Night',
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
            j_tstmod_hextech_gunblade = {
                name = 'Hextech Gunblade',
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
            j_tstmod_hextech_rocketbelt = {
                name = 'Hextech Rocketbelt',
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
            j_tstmod_horizon_focus = {
                name = 'Horizon Focus',
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
            j_tstmod_hubris = {
                name = 'Hubris',
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
            j_tstmod_hullbreaker = {
                name = 'Hullbreaker',
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
            j_tstmod_iceborn_gauntlet = {
                name = 'Iceborn Gauntlet',
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
            j_tstmod_immortal_shieldbow = {
                name = 'Immortal Shieldbow',
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
            j_tstmod_imperial_mandate = {
                name = 'Imperial Mandate',
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
            j_tstmod_jaksho_the_protean = {
                name = 'Jak\'Sho, The Protean',
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
            j_tstmod_kaenic_rookern = {
                name = 'Kaenic Rookern',
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
            j_tstmod_knights_vow = {
                name = 'Knight\'s Vow',
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
            j_tstmod_kraken_slayer = {
                name = 'Kraken Slayer',
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
            j_tstmod_liandrys_torment = {
                name = 'Liandry\'s Torment',
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
            j_tstmod_lich_bane = {
                name = 'Lich Bane',
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
            j_tstmod_malignance = {
                name = 'Malignance',
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
            j_tstmod_mejais_soulstealer = {
                name = 'Mejai\'s Soulstealer',
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
            j_tstmod_mercurial_scimitar = {
                name = 'Mercurial Scimitar',
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
            j_tstmod_mikaels_blessing = {
                name = 'Mikael\'s Blessing',
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
            j_tstmod_moonstone_renewer = {
                name = 'Moonstone Renewer',
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
            j_tstmod_morellonomicon = {
                name = 'Morellonomicon',
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
        }
    }
}