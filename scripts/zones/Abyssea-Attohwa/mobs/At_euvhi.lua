-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: At'euvhi
-----------------------------------
mixins =
{
    require("scripts/mixins/families/euvhi"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
