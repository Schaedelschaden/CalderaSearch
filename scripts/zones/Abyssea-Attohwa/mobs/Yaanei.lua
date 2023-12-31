-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Yaanei
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 3

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

    mob:addMod(tpz.mod.STUNRES, 90)
    mob:addMod(tpz.mod.PARALYZERES, 65)
    mob:addMod(tpz.mod.DEF, 500)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
