SMODS.Joker {
    key = "colourblind",
    Ability = { name = 'Colourblind',},
    set = "Joker",
    pos = {x = 1, y = 2},
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'ClipsJokers',
    rarity = 2,
    
    -- this joker doesn't have a calculate function.
    -- the function for suit matching happens in the games card.lua, and the check for this cards name field
    -- is patched in via the lovely.toml file.
}