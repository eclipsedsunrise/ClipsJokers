SMODS.Joker {
    key = 'shareholder',
    config = { extra = { x_mult= 1, scaling = 0.05}},
    loc_vars = function(self, info_queue, card)
        return { vars =  { card.ability.extra.x_mult, card.ability.extra.scaling}}
    end,

    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    rarity = 3,
    atlas = "ClipsJokers",
    pos = {x = 9, y = 0},
    cost = 6,
    
    calculate = function(self, card, context)
        if context.end_of_round 
        and not context.repetition 
        and not context.game_over 
        and not context.blueprint 
        and not self.debuff
        and not context.individual then
            if G.GAME.dollars > 0 then
                local half = G.GAME.dollars / 2
                half = math.floor(half) -- rounding function.
                ease_dollars(-half, true) --instant needs to be set true to avoid race conditions
                card.ability.extra.x_mult = card.ability.extra.x_mult + ( card.ability.extra.scaling * half)
            end
            return {
                message = localize('k_invested')
            }
        end
        if context.joker_main and card.ability.extra.x_mult > 1 and not self.debuff then
            return {
            xmult = card.ability.extra.x_mult
            }
        end
    end
}