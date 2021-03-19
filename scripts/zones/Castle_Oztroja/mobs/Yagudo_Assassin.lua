-----------------------------------
-- Area: Castle Oztroja
--   Mob: Yagudo Assassin (NIN)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

local TzeeXicuLink = {17396119, 17396123, 17396126, 17396131}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 4 do
		if (mob:getID() == TzeeXicuLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 500)
			mob:addMod(tpz.mod.ACC, 600)
			mob:addMod(tpz.mod.DEF, 200)
			mob:addMod(tpz.mod.MDEF, 20)
			mob:addMod(tpz.mod.EVA, 500)
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