SMODS.Joker {
    key = "glock",
    config = { extra = {max_mult = 17, mult = 17, shoot = 0, shot = 1}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max_mult, 
                card.ability.extra.mult,
                card.ability.extra.shot,  
            }
        }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    atlas = "ClipsJokers",
    pos = { x  = 3, y = 1 },
    cost = 6,

    calculate = function(self, card, context)
        --decremints the card if it's been used.
        if context.post_joker
        or context.before 
        and not context.blueprint
        and not self.debuff 
        and card.ability.extra.shoot == 1 then
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.shoot
            card.ability.extra.shoot = 0
        end

        if context.joker_main and not self.debuff then
            if card.ability.extra.mult > 0 then
                card.ability.extra.shoot = 1
                return {
                    mult = card.ability.extra.mult,
                    card = card,
                    message = localize("k_bang"),
                }
            end
        end

        -- resets the card if mult is at 0 (mag is empty)
        if context.post_joker 
        and not self.debuff 
        and not context.blueprint 
        and card.ability.extra.mult <= 0 then
            card.ability.extra.mult = card.ability.extra.max_mult
            return {
                card = card,
                message = localize("k_reloaded"),
            }
        end

    end
}