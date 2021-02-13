-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Maldaramet B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.MATT, 400)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onMobDeath(mob, player, isKiller)
end
