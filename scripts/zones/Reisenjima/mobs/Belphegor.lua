-----------------------------------
-- Area: Reisenjima
--  Mob: Belphegor
-- Spawn: 
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PIERCERES, 50)
	mob:setMod(tpz.mod.SLASHRES, 25)
	mob:setMod(tpz.mod.IMPACTRES, -50)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
end