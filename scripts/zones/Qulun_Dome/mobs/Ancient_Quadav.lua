-----------------------------------
-- Area: Qulun Dome
--   NM: Ancient Quadav (WAR)
-----------------------------------

local AdamantkingLink = {17383425, 17383429, 17383438}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 3 do
		if (mob:getID() == AdamantkingLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 500)
			mob:addMod(tpz.mod.ACC, 400)
			mob:addMod(tpz.mod.DEF, 100)
			mob:addMod(tpz.mod.MDEF, 15)
			mob:addMod(tpz.mod.EVA, 250)
			mob:addMod(tpz.mod.MEVA, 100)
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