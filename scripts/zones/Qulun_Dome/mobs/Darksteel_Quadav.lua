-----------------------------------
-- Area: Qulun Dome
--   NM: Darksteel Quadav (PLD)
-----------------------------------

local AdamantkingLink = {17383434, 17383436}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	for i = 1, 2 do
		if (mob:getID() == AdamantkingLink[i]) then
			mob:setMobLevel(110)
			mob:setRespawnTime(420)
			mob:addMod(tpz.mod.ATT, 250)
			mob:addMod(tpz.mod.ACC, 250)
			mob:addMod(tpz.mod.DEF, 750)
			mob:addMod(tpz.mod.MDEF, 30)
			mob:addMod(tpz.mod.EVA, 250)
			mob:addMod(tpz.mod.MEVA, 500)
		end
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end