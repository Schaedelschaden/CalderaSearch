-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Nightmare Hippogryph
-----------------------------------
mixins = {require("scripts/mixins/dynamis_dreamland")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1452)
		mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 80)
	mob:addMod(tpz.mod.DEF, 400)
	mob:addMod(tpz.mod.EVA, 300)
	mob:addMod(tpz.mod.MEVA, 300)
end

function onMobDeath(mob, player, isKiller)
end
