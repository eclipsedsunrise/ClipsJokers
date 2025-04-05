SMODS.Atlas{
    key = "ClipsJokers",
    path = "ClipsJokers.png",
    px = 71,        -- x and y values include a pixel on each side for spacing
    py = 95,
}
SMODS.Atlas{
    path = "mod_icon.png",
    key = "modicon",
    px = 34,
    py = 34,
}

-- loads the common files. Peasants.
assert(SMODS.load_file("common.lua"))()

-- safe-guard against nested folders (unapplied lovely patches)
local lovely_toml_info = NFS.getInfo(SMODS.current_mod.path .. "lovely.toml")
local lovely_dir_items = NFS.getInfo(SMODS.current_mod.path .. "lovely") and NFS.getDirectoryItems(SMODS.current_mod.path .. "lovely")
local should_have_lovely = lovely_toml_info or (lovely_dir_items and #lovely_dir_items > 0)
if should_have_lovely then
    -- if we have detected a `lovely.toml` file or a non-empty `lovely` directory (assumption that it contains lovely patches)
    assert(SMODS.current_mod.lovely, "Failed to detect ClipsJokers lovely patches.\nMake sure your Clips_jokers_mod folder is not nested (there should be a bunch of files in the mod folder and not just another folder).\n\n\n")
end

-- load all individual jokers
local subdir = "cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end