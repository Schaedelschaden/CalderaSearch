-----------------------------------
-- Area: Castle Oztroja
--   NM: Yagudo High Priest (WHM)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

local TzeeXicuLink = {17396127, 17396133}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 2 do
		if (mob:getID() == TzeeXicuLink[i]) then
			mob:setMobLevel(120)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 150)
			mob:addMod(tpz.mod.MATT, 400)
			mob:addMod(tpz.mod.ACC, 250)
			mob:addMod(tpz.mod.MACC, 500)
			mob:addMod(tpz.mod.DEF, 100)
			mob:addMod(tpz.mod.MDEF, 20)
			mob:addMod(tpz.mod.EVA, 150)
			mob:addMod(tpz.mod.MEVA, 200)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end