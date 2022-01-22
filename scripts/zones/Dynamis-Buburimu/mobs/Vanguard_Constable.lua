-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Constable
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Buburimu/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 80)
	mob:addMod(tpz.mod.DEF, 400)
	mob:addMod(tpz.mod.EVA, 300)
	mob:addMod(tpz.mod.MEVA, 300)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.GIBHE_FLESHEATER_PH, 10, 1200) -- 20 minutes
end
