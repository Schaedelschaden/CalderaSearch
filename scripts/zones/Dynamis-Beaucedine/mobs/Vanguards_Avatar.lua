-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Vanguard's Avatar
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.EVA, 300)
	mob:addMod(tpz.mod.MEVA, 150)
	mob:addMod(tpz.mod.MACC, 700)
	mob:addMod(tpz.mod.MATT, 85)
	mob:addMod(tpz.mod.MDEF, 60)
end

function onMobDeath(mob, player, isKiller)
	
end