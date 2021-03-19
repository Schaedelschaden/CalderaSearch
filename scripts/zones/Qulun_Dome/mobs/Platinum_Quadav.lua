-----------------------------------
-- Area: Qulun Dome
--   NM: Platinum Quadav (THF)
-----------------------------------

local AdamantkingLink = {17383431, 17383439}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 2 do
		if (mob:getID() == AdamantkingLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 350)
			mob:addMod(tpz.mod.ACC, 600)
			mob:addMod(tpz.mod.DEF, 100)
			mob:addMod(tpz.mod.MDEF, 10)
			mob:addMod(tpz.mod.EVA, 500)
			mob:addMod(tpz.mod.MEVA, 200)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end