-----------------------------------
-- Area: Qulun Dome
--   NM: Ruby Quadav (RDM)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

local AdamantkingRoom = {17383441}

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)

	if (mob:getID() == AdamantkingRoom[1]) then
		mob:setMobLevel(110)
		mob:setRespawnTime(900)
		mob:addMod(tpz.mod.ATT, 150)
		mob:addMod(tpz.mod.MATT, 300)
		mob:addMod(tpz.mod.ACC, 250)
		mob:addMod(tpz.mod.MACC, 500)
		mob:addMod(tpz.mod.DEF, 100)
		mob:addMod(tpz.mod.MDEF, 20)
		mob:addMod(tpz.mod.EVA, 150)
		mob:addMod(tpz.mod.MEVA, 250)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
    
end