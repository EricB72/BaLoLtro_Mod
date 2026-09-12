--Atlasses (Sprites)
SMODS.Atlas {
    key = 'common_league_items',
    path = 'common_league_items.png',
    px = 68,
    py = 67.5,
}

SMODS.Atlas {
    key = 'uncommon_league_items',
    path = 'uncommon_league_items.png',
    px = 68,
    py = 67.5,
}

SMODS.Atlas {
    key = 'rare_league_items',
    path = 'rare_league_items.png',
    px = 68,
    py = 67.5,
}

SMODS.Atlas {
    key = 'league_items',
    path = 'league_items.png',
    px = 66,
    py = 67,
}

SMODS.Atlas {
    key = 'legendary_league_items',
    path = 'legendary_league_items.png',
    px = 79,
    py = 78,
}

SMODS.Atlas {
    key = 'other_league',
    path = 'other_league.png',
    px = 71,
    py = 95,
}

--File Loading
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")

for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local enhancements_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/enhancements")

for _, file in ipairs(enhancements_src) do
    assert(SMODS.load_file("src/enhancements/" .. file))()
end

--[[local editions_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/editions")

for _, file in ipairs(editions_src) do
    assert(SMODS.load_file("src/editions/" .. file))()
end]]

-- Colours
local trueDMG = SMODS.Gradient({
	key = "trueDMG",
	colours = { HEX("bfbfbf"), HEX("ffffff") },
	cycle = 5,
})