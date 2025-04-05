SMODS.Joker {
    key = "strangeloop",
    config = { extra = { mult = 0, a_mult = 1, }},
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.mult, 
                card.ability.extra.a_mult, 
                G.GAME.current_round.s_loop_card.rank
            }}
        end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 3,
    atlas = "ClipsJokers",
    pos = {x = 0, y = 2},
    cost = 7,

    calculate = function(self, card, context)
        --if it looks stupid but it works, it's not stupid. I hope.
        local kludge = {"Ace", "Two", "Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"}
        
        if context.joker_main 
        and card.ability.extra.mult > 0 
        and not context.debuff then
            return {
                mult = card.ability.extra.mult,
            }
        end
        --check during a discard for the discard target
        if context.discard and not context.blueprint then
            if not context.other_card.debuff and context.other_card:get_id() == G.GAME.current_round.s_loop_card.id then
                --discarding an ace loops us back around and doubles the card mult
                if context.other_card:get_id() == 14 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult
                    G.GAME.current_round.s_loop_card.id = G.GAME.current_round.s_loop_card.id - 1
                    G.GAME.current_round.s_loop_card.rank = kludge[G.GAME.current_round.s_loop_card.id]
                    return {
                        message = localize('k_looped'),
                        colour = G.C.RED,
                    }

                --I'm smart and totally checked that the id for Ace is 14 and not 1 before writing this card.
                elseif context.other_card:get_id() == 2 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                    G.GAME.current_round.s_loop_card.id = 14
                    G.GAME.current_round.s_loop_card.rank = "Ace"
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.RED,
                    }
                --otherwise we just decrement the loop card and add one mult.
                else
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                    G.GAME.current_round.s_loop_card.id = G.GAME.current_round.s_loop_card.id - 1
                    --feeds the card ID as the array index for kludge, landing on the correct 'string'
                    G.GAME.current_round.s_loop_card.rank = kludge[G.GAME.current_round.s_loop_card.id]
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.RED,
                    }
                end  
            end
        end
    end
}