-----------------------------------
-- Area: Monastic Cavern
--   Mob: Orcish Farkiller
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
require("scripts/globals/status")
-----------------------------------

local OverlordLink = {17391768, 17391773, 17391761}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 3 do
		if (mob:getID() == OverlordLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 300)
			mob:addMod(tpz.mod.RATT, 300)
			mob:addMod(tpz.mod.ACC, 300)
			mob:addMod(tpz.mod.RACC, 400)
			mob:addMod(tpz.mod.DEF, 200)
			mob:addMod(tpz.mod.MDEF, 20)
			mob:addMod(tpz.mod.EVA, 150)
			mob:addMod(tpz.mod.MEVA, 150)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end
