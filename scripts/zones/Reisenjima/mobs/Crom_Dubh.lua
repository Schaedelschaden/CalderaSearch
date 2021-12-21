-----------------------------------
-- Area: Reisenjima
--  Mob: Crom Dubh
-- Spawn: 
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.FIRERES, -30)
	mob:setMod(tpz.mod.LIGHTRES, -30)
	mob:setMod(tpz.mod.EARTHRES, 30)
	mob:setMod(tpz.mod.EARTHRES, 30)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
end