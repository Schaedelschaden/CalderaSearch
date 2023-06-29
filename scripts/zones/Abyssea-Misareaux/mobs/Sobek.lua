-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Sobek
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 40)
    mob:addMod(tpz.mod.ACC, 150)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
