SMODS.Joker {
    key = "theoldmaster",
    config = { extra = { mult = 7, earn_amt = 1}},
    -- Localization Variables
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.earn_amt}}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    atlas = "ClipsJokers",
    pos = { x = 0, y = 0},
    cost = 6,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, "m_wild") or
               SMODS.has_enhancement(context.other_card, "m_steel") or
               SMODS.has_enhancement(context.other_card, "m_mult") or
               SMODS.has_enhancement(context.other_card, "m_lucky") or
               SMODS.has_enhancement(context.other_card,  "m_gold") or
               SMODS.has_enhancement(context.other_card,  "m_glass") or
               SMODS.has_enhancement(context.other_card, "m_bonus") then
                if not context.other_card.debuff and context.other_card:is_face() then
                    return { 
                        mult = card.ability.extra.mult,
                        dollars = card.ability.extra.earn_amt
                    }
                end
               end
        end
    end

}
