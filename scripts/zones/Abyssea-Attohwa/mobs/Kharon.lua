-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Kharon
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMod(tpz.mod.SILENCERES, 90)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    tpz.abyssea.kiOnMobDeath(mob, player)
end
