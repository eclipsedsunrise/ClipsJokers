SMODS.Joker {
    key = "investor",
    set = "Joker",
    config = { extra = { earn_amt = 6}},
    loc_vars = function(self, info_queue, card)
        return { vars = card.ability.extra.earn_amt}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    rarity = 1,
    atlas = 'ClipsJokers',
    pos = {x = 7, y = 0},
    cost = 4,

    --Investor does not have a calculate function
    -- the chip check and awarding of money happens in the function Card:calculate_dollar_bonus()
    -- in the balatro engine file card.lua. The TOML patch to insert Investors' code is in the lovely.toml file for
    -- this mod.
}