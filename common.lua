-- event to reset gambler cards
function reset_gambler_cards()
    G.GAME.current_round.gambler_card_1.rank = 'Ace'
    G.GAME.current_round.gambler_card_2.rank = 'Ace'
    G.GAME.current_round.gambler_card_3.rank = 'Ace'
    G.GAME.current_round.gambler_card_1.suit = 'Spades'
    G.GAME.current_round.gambler_card_2.suit = 'Hearts'
    G.GAME.current_round.gambler_card_3.suit = 'Diamonds'
    local valid_gambler_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' then
            valid_gambler_cards[#valid_gambler_cards+1] = v
        end
    end
    
    if valid_gambler_cards[3] then
        local gambler_card_1 = pseudorandom_element(valid_gambler_cards, pseudoseed('gambler1'..G.GAME.round_resets.ante))
        G.GAME.current_round.gambler_card_1.rank = gambler_card_1.base.value
        G.GAME.current_round.gambler_card_1.suit = gambler_card_1.base.suit
        G.GAME.current_round.gambler_card_1.id = gambler_card_1.base.id

        local gambler_card_2 = pseudorandom_element(valid_gambler_cards, pseudoseed('gambler2'..G.GAME.round_resets.ante))
        G.GAME.current_round.gambler_card_2.rank = gambler_card_2.base.value
        G.GAME.current_round.gambler_card_2.suit = gambler_card_2.base.suit
        G.GAME.current_round.gambler_card_2.id = gambler_card_2.base.id

        local gambler_card_3 = pseudorandom_element(valid_gambler_cards, pseudoseed('gambler3'..G.GAME.round_resets.ante))
        G.GAME.current_round.gambler_card_3.rank = gambler_card_3.base.value
        G.GAME.current_round.gambler_card_3.suit = gambler_card_3.base.suit
        G.GAME.current_round.gambler_card_3.id = gambler_card_3.base.id
    end
end

local old_loc_colour = loc_colour
function loc_colour(_c, _default)
    -- hook for custom colours
    local custom_colours = {
        neat_lia = HEX("A7C7E7"),
        neat_lars = HEX("1F62CA"),
        clips_me = HEX("0f3672")
    }
    if custom_colours[_c] then
        return custom_colours[_c]
    end

    return old_loc_colour(_c, _default)
end

