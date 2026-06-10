--Atlasses (Sprites)
SMODS.Atlas {
    key = 'league_items',
    path = 'league_items.png',
    px = 71,
    py = 95
}

--File Loading
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")

for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end