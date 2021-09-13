-----------------------------------
-- Area: Promyvion-Dem
--   NM: Weeper
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, 200)
end

function onMobDeath(mob, player, isKiller)
end
