-----------------------------------
-- Area: Apollyon NW
--  Mob: Criosphinx
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    
end

function onMobEngaged(mob, target)
	local hieracosphinx = GetMobByID(16933114)
	local dayElement = VanadielDayElement()
	local dropAssigned = mob:getLocalVar("SPHINX_DROP_ASSIGNED")

	if (dayElement == tpz.day.EARTHSDAY or dayElement == tpz.day.WATERSDAY or dayElement == tpz.day.ICEDAY or dayElement == tpz.day.DARKSDAY and
		dropAssigned == 0) then
		mob:setDropID(3284)
		mob:setLocalVar("SPHINX_DROP_ASSIGNED", 1)
		
		-- Hieracosphinx is still alive and must be told to keep its dropID as 0 to prevent double dipping
		if (hieracosphinx:isAlive()) then
			hieracosphinx:setLocalVar("SPHINX_DROP_ASSIGNED", 1)
			hieracosphinx:setDropID(0)
		end
	end
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller, noKiller)
	
end