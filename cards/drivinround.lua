SMODS.Joker {
    key = 'drivinround',
    config = { extra = { x_chips = 2}},
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = 'ClipsJokers',
    pos = { x = 6, y = 0},
    cost = 4,

    -- the first scored 6 or 9 doubles chips
    calculate = function(self, card, context)
        if context.individual 
        and context.cardarea == G.play 
        and not context.end_of_round 
        and not self.debuff then
            local first_rope = nil
            for i= 1, #context.scoring_hand do
                if context.scoring_hand[i].base.id == 6 or context.scoring_hand[i].base.id == 9 then
                    first_rope = context.scoring_hand[i]; break 
                end
            end

            if context.other_card == first_rope then
                return {
                    xchips = card.ability.extra.x_chips,
                    message = localize('k_almph'),
                    colour = G.C.BLUE,
                }
            end
        end
    end
}