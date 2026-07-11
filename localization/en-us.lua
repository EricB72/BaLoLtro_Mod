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
                    '{C:attention}+#1#{} hand size',
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
                        '{C:inactive}(Crit Chance: #8#/#9# (#10#%), Crit DMG: #7#%)'
                    }
                }
            },
            j_tstmod_infinity_edge = {
                name = 'Infinity Edge',
                text = {
                    {
                        'Grants {C:green}#2#%{} {C:mult}Critical Chance{},',
                        'and {C:green}#4#% {X:mult,C:white}Critical Damage{}',
                        '{C:inactive}(Crit Chance: #7#/#8# (#9#%), Crit DMG: #6#%)'
                    }
                }
            },
            j_tstmod_essence_reaver = {
                name = 'Essence Reaver',
                text = {
                    {
                        'Grants {C:green}#6#%{} {C:mult}Critical Chance{}.',
                        '{C:inactive}(Crit Chance: #9#/#10# (#11#%), Crit DMG: #8#%)'
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
                        'Each instance of {X:mult,C:white}Mult{}',
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
                        '{C:mult}+#1#{} Mult, {C:mult}+#2#{} every time a {C:attention}Glass',
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
                        'Gain luck equal to {C:attention}BaseMult{} / #4#,',
                        'of the played hand.',
                        '{C:inactive}(Current: {C:green}#3# / #4#{}{C:inactive}){}'
                    },
                    {
                        'After each {C:attention}Boss Blind{} gain {C:money}$#1#{}',
                        'and reduce denominator by',
                        '{C:attention}#2#{}, up to {C:attention}1{}.'

                    }
                }
            },
            j_tstmod_experimental_hexplate = {
                name = 'Experimental Hexplate',
                text = {
                    {
                        'Every {C:attention}#3# highest level{} hand',
                        'played grants: {C:attention}#2#{} {C:green}free reroll/s',
                        'and a {C:chips}planet{} card which has',
                        'a {C.green}#5# / #6#{} chance of being the played hand card. ',
                        '{C:inactive}(Highest: #1#){}'
                    }
                }
            },
            j_tstmod_fiendhunter_bolts = {
                name = 'Fiendhunter Bolts',
                text = {
                    {
                        '{C.green}#2#%{} {C:mult}Crit Chance{}.',
                        '{C:inactive}(Crit Chance: #5#/#6# (#7#%), Crit DMG: #4#%)'
                    },
                    {
                        'Playing your {C:attention}highest level',
                        '{C:attention}hand{} grants a stack.',
                        'Each stack grants {X:mult,C:white}X#9#{} Mult.',
                        '{C:inactive}Resets if not playing your',
                        '{C:inactive}highest level hand.',
                        '{C:inactive}(Currently  {X:mult,C:white}X#10#{} {C:inactive}Mult){}'
                    },
                    {
                        '{X:mult,C:white}XMult{} given by this joker',
                        'is afected by {C:mult}crits{}.'
                    }
                }
            },
            j_tstmod_force_of_nature = {
                name = 'Force of Nature',
                text = {
                    {
                        '{C.green}Rerolling{} grants a stack,',
                        'buying a {C:purple}booster pack{} grants',
                        'a stack for each card.',
                        '{C:inactive}(Stacks: #2#){}'
                    },
                    {
                        'For every {C:attention}#6#{} stacks grants',
                        '{C:attention}+#5#{} hand size and {C:chips}+#3#{} Chips.',
                        '{C:inactive}Hand size resets upon ending round.'
                    }
                }
            },
            j_tstmod_frozen_heart = {
                name = 'Frozen Heart',
                text = {
                    {
                        '{C:chips}+#1#{} Chips.'
                    },
                    {
                        'Gain a {C:green}Vouchers Bought / #3#{} chance',
                        'of disabling a {C.attention}Boss Blind{}.',
                        'If this triggers, increase',
                        'denominator by {C:attention}#4#{} and Chips by {C:chips}+15{}.'
                    },
                    {
                        'Reduces Voucher prices by {X:purple,C:white}#5#%{}.'
                    }
                }
            },
            j_tstmod_guardian_angel = {
                name = 'Guardian Angel',
                text = {
                    {
                        'Upon {C:purple}death{}, {C:attention}REVIVE{} and,',
                        'enhance half of your deck',
                        'with {C:attention}Glass cards{}.',
                        '{C:inactive}CAN AFFECT ENHANCED CARDS{}'
                    }
                }
            },
            j_tstmod_guinsoos_rageblade = {
                name = 'Guinsoo\'s Rageblade',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_hexoptics_c44 = {
                name = 'Hexoptics C44',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Mult, equal to diference ',
                        'between {C:attention}left-most{} and {C:attention}right-most{}',
                        'card in hand * {C:attention}#2#{}.'
                    }
                }
            },
            j_tstmod_hextech_gunblade = {
                name = 'Hextech Gunblade',
                text = {
                    {
                        'Sell this joker to obtain {X:purple,C:white}#1#%{} total',
                        'score, {C:chips}+#2#{} hand and {C:mult}+#3#{} discard.'
                    }
                }
            },
            j_tstmod_hextech_rocketbelt = {
                name = 'Hextech Rocketbelt',
                text = {
                    {
                        '{C:chips}+#1#{} Chips and {X:chips,C:white}X#3#{} Chips',
                        'each {C:green}skip{} increase Chips by {C:chips}+#2#',
                        'and each {C:green}other skip{} increase',
                        'XChips by {X:chips,C:white}X#4#{}.'
                    }
                }
            },
            j_tstmod_horizon_focus = {
                name = 'Horizon Focus',
                text = {
                    {
                        '{X:chips,C:white}X#1#{} Chips, equal to diference',
                        'between {C:attention}left-most{} and {C:attention}right-most{}',
                        'card played * {C:attention}#2#{}.'
                    }
                }
            },
            j_tstmod_hubris = {
                name = 'Hubris',
                text = {
                    {
                        '{C:mult}+#1#{} Mult, at the end',
                        'of a round gain {C:mult}+#1#.',
                        'If it is a {C:attention}Boss Blind{}',
                        'gain {C:attention}twice{} the amount.'
                    },
                    {
                        '{C:green}Skipping{} blind or {C:green}rerolling',
                        '{C:green}Boss{} {C:mult}resets this jokers mult.'
                    }
                }
            },
            j_tstmod_hullbreaker = {
                name = 'Hullbreaker',
                text = {
                    {
                        'Every {C:attention}#3#{} hands gives',
                        '{C:mult}+#1#{} Mult equal to {C:money}money{}.',
                        'During a {C:attention}Boss Blind{} also gives',
                        '{X:mult,C:white}X#2#{} Mult equal to {X:purple,C:white}#4#%{} of {C:money}money{}.'
                    }
                }
            },
            j_tstmod_iceborn_gauntlet = {
                name = 'Iceborn Gauntlet',
                text = {
                    {
                        'Spellblade: {C:green}#4# / #5#{} chance of giving',
                        '{C:money}$#2#{}, {C:chips}+#1#{} Chips and disable {C:attention}Boss Blind{}.'
                    }
                }
            },
            j_tstmod_immortal_shieldbow = {
                name = 'Immortal Shieldbow',
                text = {
                    {
                        '{C:green}#8#% {C:mult}Crit Chance.',
                        '{C:inactive}(Crit Chance: #12#/#13# (#10#%), Crit DMG: #9#%)'
                    },
                    {
                        '{C:mult}+#1#{} Mult, equal to',
                        '{X:purple,C:white}#4#%{} of {C:attention}Crit DMG{}.'
                    },
                    {
                        'Every time you {C:attention}double',
                        'your current score gain',
                        '{C:mult}+#2#{} discard/s.',
                        '{C:inactive}(Score: #5#)'
                    }
                }
            },
            j_tstmod_imperial_mandate = {
                name = 'Imperial Mandate',
                text = {
                    {
                        '{C:chips}+#1#{} Chips, every {C:attention}Boss blind',
                        'disabled grants {C:chips}+#2#{} Chips.'
                    },
                    {
                        'Playing a {C:chips}hand {C:attention}after{} a {C:mult}discard',
                        'gives {X:purple,C:white}#3#%{} of missing score.',
                        'During a {C:attention}Boss Blind{} gives',
                        '{C:attention}double{} the amount instead.'
                    }
                }
            },
            j_tstmod_jaksho_the_protean = {
                name = 'Jak\'Sho, The Protean',
                text = {
                    {
                        '{X:chips,C:white}X#1#{} Chips and {X:mult,C:white}X#2#{} Mult,',
                        'disabling a {C:attention}Boss Blind',
                        'multiplies this by {X:money,C:white}X#4#.'
                    }
                }
            },
            j_tstmod_kaenic_rookern = {
                name = 'Kaenic Rookern',
                text = {
                    {
                        'Increase {C:attention}money{} given',
                        '{C:attention}per hand{} at the end of',
                        'a round by {C:money}$#1#.'
                    }
                }
            },
            j_tstmod_knights_vow = {
                name = 'Knight\'s Vow',
                text = {
                    {
                        'Jokers to the {C:attention}right{} obtain',
                        '{C:mult}eternal{}, the ones on the {C:attention}left',
                        'get eternal removed.',
                        '{C:inactive}Selling this joker keeps',
                        '{C:inactive}things like they are.',
                    },
                    {
                        '{C:attention}+1{} Joker Slot.'
                    }
                }
            },
            j_tstmod_kraken_slayer = {
                name = 'Kraken Slayer',
                text = {
                    {
                        'Each {C:attention}Ace{} played gives {C:chips}+#1#{} Chips',
                        'and {C:mult}+#2#{} Mult, scaling with {X:purple,C:white}%{} of',
                        'total score done. {C:inactive}(0% - #3#00%)'
                    }
                }
            },
            j_tstmod_liandrys_torment = {
                name = 'Liandry\'s Torment',
                text = {
                     {
                        'Each enhanced card held in hand',
                        'gives {X:purple,C:white}#1#%{} of missing score.'
                    },
                    {
                        'If the card has an {C:attention}edition',
                        'or a {C:attention}seal{}, gives {X:purple,C:white}#2#%{} instead.'
                    }
                }
            },
            j_tstmod_lich_bane = {
                name = 'Lich Bane',
                text = {
                    {
                        'Spellblade: {C:attention}+#1#{} hand size until',
                        'the {C:attention}end of the round{}.'
                    }
                }
            },
            j_tstmod_locket_of_the_iron_solari = {
                name = 'Locket of the Iron Solari',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_lord_dominiks_regards = {
                name = 'Lord Dominik\'s Regards',
                text = {
                    {
                        'Grants {C:green}#2#%{} {C:mult}Critical Chance{}',
                        '{C:inactive}(Crit Chance: #4#/#5# (#6#%), Crit DMG: #3#%)'
                    },
                    {
                        '{C:mult}Crits{} multiply their score',
                        'by the ante your are in.'
                    }
                }
            },
            j_tstmod_ludens_echo = {
                name = 'Luden\'s Echo',
                text = {
                    {
                        'Played {C:chips}Bonus cards{} enhance',
                        '{C:attention}adjacent{} cards as bonus.'
                    },
                    {
                        '{C:chips}+#2#{} Chips, {C:chips}+#3#{} per each',
                        '{C:chips}Bonus card{} in deck.',
                        '{C:inactive}(Bonus: #4#){}'
                    }
                }
            },
            j_tstmod_malignance = {
                name = 'Malignance',
                text = {
                    {
                        '{C:chisp}Bonus cards{} held in hand',
                        'give {X:chips,C:white}X#1#{} Chips.'
                    }
                }
            },
            j_tstmod_manamune = {
                name = 'Manamune',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_muramana = {
                name = 'Muramana',
                text = {
                    {
                        'NOPE!'
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
                        'NOPE!'
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
                        'NOPE!'
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
                        'NOPE!'
                    }
                }
            },
            j_tstmod_profane_hydra = {
                name = 'Profane Hydra',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s will give',
                        '{X:mult,C:white}X#1#{} Mult when scored.',
                        'Each {X:green,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}#4#{}.'
                    }
                }
            },
            j_tstmod_protoplasm_harness = {
                name = 'Protoplasm Harness',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_randuins_omen = {
                name = 'Randuin\'s Omen',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_rapid_firecannon = {
                name = 'Rapid Firecannon',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_ravenous_hydra = {
                name = 'Ravenous Hydra',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s will give',
                        '{C:chips}+#1#{} Chips when scored.',
                        'Each {X:green,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}#4#{}.',
                    },
                    {
                        'The {C:attention}first hand{} of the round,',
                        'Wild Cards will {C:green}infect{}',
                        'up to {C:attention}#5#{} adjacent cards.'
                    }
                }
            },
            j_tstmod_redemption = {
                name = 'Redemption',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_riftmaker = {
                name = 'Riftmaker',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_rite_of_ruin = {
                name = 'Rite of Ruin',
                text = {
                    {
                        'NOPE!'
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
                        'to play flushes with enhancements.'
                    }
                }
            },
            j_tstmod_runaans_hurricane = {
                name = 'Runaan\'s Hurricane',
                text = {
                    {
                        'If the {C:attention}first hand played{} is',
                        'a single card, copy it {C:attention}twice{}',
                        'but with the worng rank and {C:mult}s{C:chips}u{}i{C:money}t{}.'
                    }
                }
            },
            j_tstmod_rylais_crystal_scepter = {
                name = 'Rylai\'s Crystal Scepter',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_serpents_fang = {
                name = 'Serpent\'s Fang',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_seryldas_grudge = {
                name = 'Serylda\'s Grudge',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_shurelyas_battlesong = {
                name = 'Shurelya\'s Battlesong',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_spear_of_shojin = {
                name = 'Spear of Shojin',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_spectral_cutlass = {
                name = 'Spectral Cutlass',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_spirit_visage = {
                name = 'Spirit Visage',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_staff_of_flowing_water = {
                name = 'Staff of Flowing Water',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_statikk_shiv = {
                name = 'Statikk Shiv',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_stormrazor = {
                name = 'Stormrazor',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_stormsurge = {
                name = 'Stormsurge',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_stridebreaker = {
                name = 'Stridebreaker',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s will give',
                        '{X:chips,C:white}X#1#{} Chips when scored.',
                        'Each {X:green,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}#4#{}.'
                    },
                    {
                    
                        '{C:green}Wild Cards{} held in hand will',
                        'not count as a hand slot.',
                        '{C:inactive}(Each one gives +1 temp. hand size)'
                    }
                }
            },
            j_tstmod_sundered_sky = {
                name = 'Sundered Sky',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_sunfire_aegis = {
                name = 'Sunfire Aegis',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_sword_of_blossoming_dawn = {
                name = 'Sword of Blossoming Dawn',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_terminus = {
                name = 'Terminus',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_the_collector = {
                name = 'The Collector',
                text = {
                    {
                        'Grants {C:green}#2#%{} {C:mult}Critical Chance{}',
                        '{C:inactive}(Crit Chance: #6#/#7# (#8#%), Crit DMG: #5#%)'
                    },
                    {
                        'If score missing is {X:purple,C:white}#10#%{}',
                        'or less, execute blind and gain {C:money}$#3#{}.'
                    }
                }
            },
            j_tstmod_thornmail = {
                name = 'Thornmail',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_titanic_hydra = {
                name = 'Titanic Hydra',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s in hand will',
                        'give {C:money}$#1#{} when scored.',
                        'Each {X:green,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}#4#{}.',
                    }
                }
            },
            j_tstmod_umbral_glaive = {
                name = 'Umbral Glaive',
                text = {
                    {
                        '{C:attention}#2#{} Wild Card/s in hand will',
                        'give {C:mult}+#1#{} Mult when scored.',
                        'Each {X:green,C:mult}Hydra{} owned',
                        'increases amount by {C:attention}#4#{}.',
                    }
                }
            },
            j_tstmod_unending_despair = {
                name = 'Unending Despair',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_void_staff = {
                name = 'Void Staff',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_voltaic_cyclosword = {
                name = 'Voltaic Cyclosword',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_warmogs_armor = {
                name = 'Warmogs Armor',
                text = {
                    {
                        '{C:money}$#2#{} at the end of the round,',
                        'ending a shop with equal or higher money',
                        'than when you entered, stacks by {C:money}$#3#{},',
                        'elseway, resets to 0.#1#'
                    }
                }
            },
            j_tstmod_whispering_circlet = {
                name = 'Whispering Criclet',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_diadem_of_songs = {
                name = 'Diadem of Songs',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_winters_approach = {
                name = 'Winter\'s Approach',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_fimbulwinter = {
                name = 'Fimbulwinter',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_wits_end = {
                name = 'Wit\'s End',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_yun_tal_wildarrows = {
                name = 'Yun Tal Wildarrows',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_zekes_convergence = {
                name = 'Zeke\'s Convergence',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_zhonyas_hourglass = {
                name = 'Zhonya\'s Hourglass',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            --Legendary
            j_tstmod_reapers_toll = {
                name = 'Reaper\'s Toll',
                text = {
                    {
                        '{X:purple,C:white}#1#%{} of current score.'
                    },
                    {
                        'Permanently start the blind with {X:purple,C:white}#2#%{}',
                        'of required score done. Increases',
                        'by {C:attention}1%{} each joker activation. {C:inactive}(Max: #3#%)',
                    }
                }
            },
            j_tstmod_talisman_of_ascension = {
                name = 'Talisman of Ascension',
                text = {
                    {
                        'Using a {C:attention}consumable{} gives {C:attention}1 point{}, points',
                        'are randomly distributed every time.',
                    },
                    {
                        'Gain per point:',
                        '- {C:chips}+#10#{} Chips.',
                        '- {C:mult}+#12#{} Mult.',
                        '- {X:chips,C:white}X#11#{} Chips.',
                        '- {X:mult,C:white}X#13#{} Mult.',
                        '- {C:money}$#14#{}.',
                        '- {C:chips}+#15#{} hand/s.',
                        '- {C:mult}+#16#{} discard/s.',
                        '- {C:attention}+#17#{} hand size.'
                    },
                    {
                        'Currently has {C:attention}#1# points{}:',
                        '- {C:chips}+#2#{} Chips.',
                        '- {C:mult}+#4#{} Mult.',
                        '- {X:chips,C:white}X#3#{} Chips.',
                        '- {X:mult,C:white}X#5#{} Mult.',
                        '- {C:money}$#6#{}.',
                        '- {C:chips}+#7#{} hand/s.',
                        '- {C:mult}+#8#{} discard/s.',
                        '- {C:attention}+#9#{} hand size.'
                    }
                }
            },
            j_tstmod_black_hole_gauntlet = {
                name = 'Black Hole Gauntlet',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_cloak_of_starry_night = {
                name = 'Cloak of Starry Night',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_crown_of_the_shattered_queen = {
                name = 'Crown of the Shattered Queen',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_cruelty = {
                name = 'Cruelty',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_darksteel_talons = {
                name = 'Darksteel Talons',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_decapitator = {
                name = 'Decapitator',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_demon_kings_crown = {
                name = 'Demon King\'s Crown',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_demonic_embrace = {
                name = 'Demonic Embrace',
                text = {
                    {
                        '{X:chips,C:white}X#1#{} Chips every',
                        'time {C:chips}chips{} are scored.',
                        '{X:mult,C:white}X#3#{} Mult every',
                        'time {C:mult}mult{} is scored.'
                    },
                    {
                        'Scales with total {X:purple,C:white}%{} of',
                        'score done, up to {X:purple,C:white}450%{}.'
                    }
                }
            },
            j_tstmod_detonation_orb = {
                name = 'Detonation Orb',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
            j_tstmod_diamond_tipped_spear = {
                name = 'Diamond-Tipped Spear',
                text = {
                    {
                        'NOPE!'
                    }
                }
            },
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
            m_hydra = {
                name = "Hydra",
                text = {
                    'The more {X:green,C:mult}Hydras{} you',
                    'have, the more effective',
                    'their abilities will be.'
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
            b_spellblade = 'Spellblade',
            b_hydra = 'Hydra',
            b_crit = 'Critical',
            b_exectued = 'EXECUTED',
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