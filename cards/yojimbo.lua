SMODS.Joker {
    key = "yojimbo",
    config = { extra = { a_earn = 6, dupe_protection = false}},
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.a_earn
            }
        }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    rarity = 3,
    atlas = "ClipsJokers",
    pos = { x = 5, y = 0},
    cost = 7,
    calculate = function(self, card, context)

        if context.setting_blind and not self.debuff and not context.blueprint then
            card.ability.extra.dupe_protection = false
        end

        if G.GAME.blind.triggered and not self.debuff and not context.blueprint then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then 
                sendDebugMessage("Yojimbo - we've triggered the boss blind", "mysummercar")
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
                --this block is copied from ceremonial dagger. live by the sword, die by the sword.
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then my_pos = i; break end
                end
                if my_pos and not card.getting_sliced then
                    local sliced_card = G.jokers.cards[my_pos]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                end
            end
        end
        --if sold, kill the rest of the jokers.
        --it's an intentional mechanic that you get the full sell value if the card is debuffed/ceremonialed
        if context.selling_self and not self.debuff and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == self then
                    --do nothing! This prevents an order-of-operations issue where it dies before getting the money
                elseif G.jokers.cards[i].ability.eternal then
                    --do nothing!
                else
                    local sliced_card = G.jokers.cards[i]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                end
            end
        end
        --gain sell value at the end of round.
        if context.end_of_round and 
        not context.blueprint and 
        not self.debuff 
        and not context.individual
        and not context.repetition 
        and card.ability.extra.dupe_protection ~= true then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.a_earn
            card:set_cost()
            card.ability.extra.dupe_protection = true
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY,
            }
        end
    end

}