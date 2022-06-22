-----------------------------------
-- Area: Xarcabard (S)
--  Mob: Caracel
-- Note: 
-----------------------------------
local ID = 
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATT, 400)	
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.EVA, 200)
	mob:addMod(tpz.mod.ACC, 80)
	mob:addMod(tpz.mod.STR, 80)
	mob:addMod(tpz.mod.DEX, 80)
	mob:addMod(tpz.mod.VIT, 80)
	mob:addMod(tpz.mod.AGI, 80)
	mob:addMod(tpz.mod.INT, 80)
	mob:addMod(tpz.mod.MND, 80)
	mob:addMod(tpz.mod.CHR, 80)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
