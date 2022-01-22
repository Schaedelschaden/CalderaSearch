-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Vanguard's Avatar
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 80)
	mob:addMod(tpz.mod.DEF, 400)
	mob:addMod(tpz.mod.EVA, 300)
	mob:addMod(tpz.mod.MEVA, 300)
end

function onMobDeath(mob, player, isKiller)
	
end