-----------------------------------
-- Area: Promyvion-Vahzl
--   NM: Thinker
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    if (mob:getMainLvl() > 134) then
		mob:setMobLevel(134)
	end
end

function onMobDeath(mob, player, isKiller)
end
