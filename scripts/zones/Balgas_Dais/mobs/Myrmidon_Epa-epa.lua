-----------------------------------
-- Area: Balga's Dais
--  Mob: Myrmidon Epa-epa
-- BCNM: Royal Succession
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	-- mob:addMod(tpz.mod.ACC, 800)
	-- mob:addMod(tpz.mod.ATT, 700)
	-- mob:addMod(tpz.mod.REGAIN, 100)
	-- mob:addMod(tpz.mod.DEF, 500)
	-- mob:addMod(tpz.mod.EVA, 100)
	-- mob:addMod(tpz.mod.MEVA, 125)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SLEEPRES, 90)
end

function onMobDeath(mob, player, isKiller)
end
