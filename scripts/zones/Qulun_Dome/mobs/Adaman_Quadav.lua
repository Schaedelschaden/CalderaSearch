-----------------------------------
-- Area: Qulun Dome
--   NM: Adaman Quadav (DRK)
-----------------------------------

local AdamantkingRoom = {17383440}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	if (mob:getID() == AdamantkingRoom[1]) then
		mob:setMobLevel(110)
		mob:setRespawnTime(900)
		mob:addMod(tpz.mod.CRITHITRATE, 50)
		mob:addMod(tpz.mod.CRIT_DMG_INCREASE, 100)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end