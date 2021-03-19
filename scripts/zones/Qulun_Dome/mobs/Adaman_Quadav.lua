-----------------------------------
-- Area: Qulun Dome
--   NM: Adaman Quadav (DRK)
-----------------------------------

local AdamantkingLink = {17383440}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	if (mob:getID() == AdamantkingLink[i]) then
		mob:setMobLevel(115)
		mob:setRespawnTime(420)
		mob:addMod(tpz.mod.ATT, 750)
		mob:addMod(tpz.mod.ACC, 200)
		mob:addMod(tpz.mod.DEF, 150)
		mob:addMod(tpz.mod.MDEF, 10)
		mob:addMod(tpz.mod.EVA, 250)
		mob:addMod(tpz.mod.MEVA, 150)
		mob:addMod(tpz.mod.CRITHITRATE, 50)
		mob:addMod(tpz.mod.CRIT_DMG_INCREASE, 150)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end