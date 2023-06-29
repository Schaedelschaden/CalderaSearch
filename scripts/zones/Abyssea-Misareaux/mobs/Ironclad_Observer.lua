-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Ironclad Observer
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.FASTCAST, 60)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
