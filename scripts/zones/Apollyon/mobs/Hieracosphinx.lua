-----------------------------------
-- Area: Apollyon NW
--  Mob: Hieracosphinx
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    
end

function onMobEngaged(mob, target)
	local criosphinx = GetMobByID(16933113)
	local dayElement = VanadielDayElement()
	local dropAssigned = mob:getLocalVar("SPHINX_DROP_ASSIGNED")

	if (dayElement == tpz.day.FIRESDAY or dayElement == tpz.day.WINDSDAY or dayElement == tpz.day.LIGHTNINGDAY or dayElement == tpz.day.LIGHTSDAY and
		dropAssigned == 0) then
		mob:setDropID(3284)
		mob:setLocalVar("SPHINX_DROP_ASSIGNED", 1)
		
		-- Criosphinx is still alive and must be told to keep its dropID as 0 to prevent double dipping
		if (criosphinx:isAlive()) then
			criosphinx:setLocalVar("SPHINX_DROP_ASSIGNED", 1)
			criosphinx:setDropID(0)
		end
	end
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller, noKiller)
	
end