-----------------------------------
-- Area: West Ronfaure (100)
--   NM: Jaggedy-Eared Jack
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.MUG_GIL, 65000)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 148)
end
