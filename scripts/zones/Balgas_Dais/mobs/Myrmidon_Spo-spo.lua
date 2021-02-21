-----------------------------------
-- Area: Balga's Dais
--  Mob: Myrmidon Spo-spo
-- BCNM: Royal Succession
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn (mob)
	mob:addMod(tpz.mod.ACC, 800)
	mob:addMod(tpz.mod.ATT, 700)
	mob:addMod(tpz.mod.REGAIN, 100)
		mob:addMod(tpz.mod.DEF, 500)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SLEEPRES, 150)
end

function onMobDeath(mob, player, isKiller)
end
