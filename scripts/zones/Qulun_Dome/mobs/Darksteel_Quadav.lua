-----------------------------------
-- Area: Qulun Dome
--   NM: Darksteel Quadav (PLD)
-----------------------------------

local AdamantkingRoom = {17383434, 17383436}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 2 do
		if (mob:getID() == AdamantkingRoom[i]) then
			mob:setMobLevel(105)
			mob:setRespawnTime(900)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end