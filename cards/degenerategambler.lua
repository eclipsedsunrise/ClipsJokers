SMODS.Joker {
    key = "degenerategambler",
    config = {extra = { x_mult = 1, scaling = 1.5}},
    loc_vars = function(self, info_queue, card)
            return { 
                vars = {
                    card.ability.extra.scaling, 
                    card.ability.extra.x_mult,
                    localize(G.GAME.current_round.gambler_card_1.rank,'ranks'),
                    localize(G.GAME.current_round.gambler_card_2.rank,'ranks'),
                    localize(G.GAME.current_round.gambler_card_3.rank,'ranks'),
                    localize(G.GAME.current_round.gambler_card_1.suit,'suits_plural'),
                    localize(G.GAME.current_round.gambler_card_2.suit,'suits_plural'),
                    localize(G.GAME.current_round.gambler_card_3.suit,'suits_plural'),
                    colours = {
                        G.C.SUITS[G.GAME.current_round.gambler_card_1.suit],
                        G.C.SUITS[G.GAME.current_round.gambler_card_2.suit],
                        G.C.SUITS[G.GAME.current_round.gambler_card_3.suit],
                    }
                }
            }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 3,
    atlas = "ClipsJokers",
    pos = {x = 1, y = 0},                           -- refers to location in picture grid, 0 index'd
    cost = 7,

    -- Card function
    calculate = function(self,card,context)
        local hit_g_1 = false
        local hit_g_2 = false
        local hit_g_3 = false
        -- multihit prevents a single card triggering multiple hits if the gambler cards roll the same.
        --this is done primarily to prevent high card abuse in deep endless runs. Even if your deck is all kings of spades, you need to play 3 to get the benefit.
        local multihit = {false, false, false, false, false}

        if context.cardarea == G.jokers 
        and context.before 
        and not self.debuff
        and not context.blueprint then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == G.GAME.current_round.gambler_card_1.id 
                and context.scoring_hand[i]:is_suit(G.GAME.current_round.gambler_card_1.suit) 
                and multihit[i] == false then
                    hit_g_1 = true
                    multihit[i] = true
                end
                if context.scoring_hand[i]:get_id() == G.GAME.current_round.gambler_card_2.id 
                and context.scoring_hand[i]:is_suit(G.GAME.current_round.gambler_card_2.suit) 
                and multihit[i] == false then
                    hit_g_2 = true
                    multihit[i] = true
                end                
                if context.scoring_hand[i]:get_id() == G.GAME.current_round.gambler_card_3.id 
                and context.scoring_hand[i]:is_suit(G.GAME.current_round.gambler_card_3.suit)
                and multihit[i] == false then
                    hit_g_3 = true
                    multihit[i] = true -- probably not necessary but better safe than sorry
                end
            end
            if hit_g_1 == true
            and hit_g_2 == true
            and hit_g_3 == true then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.scaling
                return {
                    message = localize('k_upgrade_ex'),
                    card = card,
                }
            end
        end
        if context.joker_main 
        and card.ability.extra.x_mult > 1 
        and not self.debuff then
            return {
                xmult = card.ability.extra.x_mult,
                colour = G.C.RED,
                card = card
            }
        end
    end
    
}
