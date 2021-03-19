-----------------------------------
-- Area: Monastic Cavern
--   Mob: Orcish Hexspinner
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
require("scripts/globals/status")
-----------------------------------

local OverlordLink = {17391765}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	if (mob:getID() == OverlordLink[i]) then
		mob:setMobLevel(115)
		mob:setRespawnTime(420)
		mob:addMod(tpz.mod.ATT, 150)
		mob:addMod(tpz.mod.MATT, 300)
		mob:addMod(tpz.mod.ACC, 250)
		mob:addMod(tpz.mod.MACC, 500)
		mob:addMod(tpz.mod.DEF, 100)
		mob:addMod(tpz.mod.MDEF, 20)
		mob:addMod(tpz.mod.EVA, 150)
		mob:addMod(tpz.mod.MEVA, 100)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end