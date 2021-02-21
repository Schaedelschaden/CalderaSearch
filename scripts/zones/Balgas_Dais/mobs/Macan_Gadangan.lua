-----------------------------------
-- Area: Balga's Dais
--  Mob: Macan Gadangan
-- BCNM: Wild wild whiskers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
	mob:addMod(tpz.mod.ACC, 800)
	mob:addMod(tpz.mod.ATT, 500)
	mob:addMod(tpz.mod.MATT, 700)
	mob:addMod(tpz.mod.REFRESH, 100)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DEF, 500)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 8)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 15)
	mob:setMod(tpz.mod.FAST_CAST, 50)
end

function onMobDeath(mob, player, isKiller)
end