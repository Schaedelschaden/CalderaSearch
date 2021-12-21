-----------------------------------
-- Area: Qulun Dome
--   NM: Ancient Quadav (WAR)
-----------------------------------

local AdamantkingRoom = {17383425, 17383429, 17383438}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 3 do
		if (mob:getID() == AdamantkingRoom[i]) then
			mob:setMobLevel(105)
			mob:setRespawnTime(900)
			mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end