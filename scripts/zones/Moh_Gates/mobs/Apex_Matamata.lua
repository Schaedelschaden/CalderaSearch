-----------------------------------
-- Area: Moh Gates
--  Mob: Apex Matamata
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEF, 300)
	mob:addMod(tpz.mod.MEVA, 100)
end

function onMobDeath(mob, player, isKiller)
	
end