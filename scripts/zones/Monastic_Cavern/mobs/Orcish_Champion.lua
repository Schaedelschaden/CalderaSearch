-----------------------------------
-- Area: Monastic Cavern
--   Mob: Orcish Champion
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
require("scripts/globals/status")
-----------------------------------

local OverlordLink = {17391763, 17391770, 17391775, 17391780}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 4 do
		if (mob:getID() == OverlordLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 500)
			mob:addMod(tpz.mod.ACC, 400)
			mob:addMod(tpz.mod.DEF, 100)
			mob:addMod(tpz.mod.MDEF, 15)
			mob:addMod(tpz.mod.EVA, 250)
			mob:addMod(tpz.mod.MEVA, 100)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end
