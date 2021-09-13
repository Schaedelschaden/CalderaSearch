-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Gancanagh
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.SLOWRES, 80)
	mob:setMod(tpz.mod.BINDRES, 80)
	mob:setMod(tpz.mod.GRAVITYRES, 80)
	mob:setMod(tpz.mod.COUNTER, 50)
	mob:setMod(tpz.mod.COUNTER_DMG, 50)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	
end