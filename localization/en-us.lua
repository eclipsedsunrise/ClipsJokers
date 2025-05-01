return {
    descriptions = {
        Joker = {
            j_clips_theoldmaster = {
                name = "The Old Master",
                text = {
                    "Enhanced {C:attention}Face Cards{} give {C:mult}+#1#{} Mult",
                    "and {C:money}$#2#{} when scored"
                }
            },
            j_clips_degenerategambler = {
                name = "Degenerate Gambler",
                text = {
                    "This Joker gains {X:mult,C:white}x#1#{} Mult if the scored hand",
                    "contains an {C:attention}#3#{} of {V:1}#6#{}, {C:attention}#4#{} of {V:2}#7#{}, and {C:attention}#5#{} of {V:3}#8#{}.",
                    "{C:inactive}(currently {}{X:mult,C:white}x#2#{}{C:inactive} Mult){}"
                }
            },
            j_clips_pillsoclock = {
                name = "Pills o'Clock",
                text = {
                    "Upgrades the played hand every",
                    "{C:attention}#2#{} hands played or discarded",
                    "{C:inactive}({}{C:attention}#1#{} {C:inactive} hands/discards remaining){}"
                }
            },
            j_clips_packingpeanuts = {
                name = "Packing Peanuts",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips whenever",
                    "a pack is opened",
                    "{C:inactive}(Currently {}{C:chips}#2#{} {C:inactive}Chips)"
                }
            },
            j_clips_knowitall = {
                name = "Know It All",
                text = {
                    "Scored cards give {C:mult}+#1#{} Mult for each card",
                    "held in hand which shares a {C:attention}rank{} with it."
                }
            },
            j_clips_jollyroger = {
                name = "Jolly Roger",
                text = {
                    "{C:green}#3# in #2#{} chance to",
                    "{C:attention}destroy{} the first card scored",
                    "and create a {C:tarot}Tarot{} card.",
                    "{C:inactive}(must have room)"
                }
            },
            j_clips_franticjoker = {
                name = "Frantic Joker",
                text = {
                    "{C:red}+#1#{} discards",
                    "{C:blue}#2#{} hand per round",
                }
            },
            j_clips_strangeloop = {
                name = "Strange Loop",
                text = {
                    "Joker gains {C:mult}+#2#{} mult when you discard a {C:attention}#3#{}",
                    "rank decreases upon success.",
                    "{C:attention}Doubles Mult{} when an {C:attention}Ace{} is discarded this way",
                    "{C:inactive}(currently {}{C:mult}+#1#{}{C:inactive}){}",
                }
            },
            j_clips_colourblind = {
                name = 'Colourblind',
                text = {
                    "{C:diamonds}Diamonds{} and {C:clubs}Clubs{} count as the same suit",
                    "{C:hearts}Hearts{} and {C:spades}Spades{} count as the same suit"
                }
            },
            j_clips_sundayinthepark = {
                name = 'Sunday in the Park',
                text = {
                    "Retrigger each scored",
                    "{C:attention}Queen{} and {C:attention}2{}"
                }
            },
            j_clips_yojimbo = {
                name = "Yojimbo",
                text = {
                    "{C:attention}Sacrifices{} itself if the boss blind",
                    "is triggered, {C:attention}disabling the blind{}.",
                    "Gains {C:money}$#1#{} sell value per round,",
                    "{C:attention}Destroy{} all jokers if sold"
                }
            },
            j_clips_drivinround = {
                name = "Drivin' round",
                text = {
                    "First scored {C:attention}6{} or {C:attention}9{}",
                    "Doubles scored {C:chips}chips{}"
                }
            },
            j_clips_investor = {
                name = "Investor",
                text = {
                    "earn {C:money}$6{} if score is at least",
                    "{C:attention}double{} the required amount",
                }
            },
            j_clips_stakeholder = {
                name = "Stakeholder",
                text = {
                    "Gain {C:mult}+#2#{} Mult every time",
                    "a scoring card earns {C:money}Money{}",
                    "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}"
                }
            },
            j_clips_shareholder = {
                name = "Shareholder",
                text = {
                    "At end of round, lose half your",
                    "{C:money}money{}. Gain {X:mult,C:white}x#2#{} Mult per {C:money}$1{} lost",
                    "{C:inactive}(Currently {X:mult,C:white}x#1#{} {C:inactive}Mult){}"
                }
            },
            j_clips_glock = {
                name = "Glock",
                text = {
                    "{C:mult}+#2#{} Mult",
                    "{C:mult}-#3#{} Mult each hand played.",
                    "{C:inactive}Reloads when empty",
                }
            },
            j_clips_rapierwit = {
                name = "Rapier Wit",
                text = {
                    "Gives {X:mult,C:white}x#1#{} Mult when scored hand contains a {C:attention}Straight{}",
                    "Gains {X:mult,C:white}x#2#{} Mult for {C:attention}other scored hands{}",
                    "{C:inactive}(Resets after each Straight){}",
                }
            },
            j_clips_stork = {
                name = "Stork",
                text = {
                    "If the played hand is a {C:attention}Pair{}, and only has {C:attention}two cards{},",
                    "then add their {C:attention}Combined Score{} to {C:mult}Mult{}",
                }
            }
        },
        Mod = {
            Clips_Jokers = {
            name = "Clips Jokers",
            text = {
                "Presenting 18 Vanilla Balanced Jokers!",
                " ",
                "Investor, Stakeholder, and Shareholder designed and concepted by {C:attention}Imperator_Subira{}.",
                "coded by {C:chips}Clips{}(that's me!)",
                " ",
                "All other Jokers Drawn, Concepted and implemented by {C:chips}Clips{}",
                "Jokers drawn using a template posted by Reddit user {C:attention}u/VividAwareness4719{}",
                " ",
                "Code Base initially taken from {C:purple}NeatoJokers{}",
                "Original codebase programmed by {C:neat_lars}Larswijn{} and {C:neat_lia}Lia{}",
                "Assume all the terrible code is mine. Thank you everyone, please enjoy! {C:mult}<3{}"
                }
            }
        }
        
    },
    misc = {
        dictionary = {
            k_looped = "Looped!",
            k_almph = "Almpff!",
            k_bet = "Bet",
            k_invested = "Invested!",
            k_yar = "Yarrr!",
            k_actually = "Actually!",
            k_bang = "Bang!",
            k_reloaded = "Reloaded!",
            k_riposte = "Riposte!",
        }
    }
}