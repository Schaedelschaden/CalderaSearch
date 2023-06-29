-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Chhir Batti
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.WATTERRES, 150)
    mob:addMod(tpz.mod.DARKRES, 150)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
