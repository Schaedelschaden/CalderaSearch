-----------------------------------
-- Area: Castle Oztroja
--   NM: Yagudo Templar (SAM)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

local TzeeXicuLink = {17396132}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	if (mob:getID() == TzeeXicuLink[i]) then
		mob:setMobLevel(120)
		mob:setRespawnTime(420)
		mob:addMod(tpz.mod.ATT, 500)
		mob:addMod(tpz.mod.ACC, 400)
		mob:addMod(tpz.mod.DEF, 100)
		mob:addMod(tpz.mod.MDEF, 15)
		mob:addMod(tpz.mod.EVA, 250)
		mob:addMod(tpz.mod.MEVA, 100)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end