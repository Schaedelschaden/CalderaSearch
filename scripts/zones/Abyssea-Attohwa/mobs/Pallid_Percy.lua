-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Pallid Percy
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
	mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	mob:setMod(tpz.mod.DMGBREATH, -35)
end

function onMobFight(mob, target)
end

function onMobDrawIn(mob, target)
    mob:useMobAbility(2645)
end

function onMobDeath(mob, player, isKiller)
    tpz.abyssea.kiOnMobDeath(mob, player)
end
