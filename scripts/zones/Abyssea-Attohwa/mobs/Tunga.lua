-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Tunga
-----------------------------------
mixins =
{
    require("scripts/mixins/families/chigoe"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.HASTE_ABILITY, 1500)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.REGEN, 250)
end

function onMobFight(mob, target)

    --CHAINSPELL until death.
    if mob:getHPP() <= 10 and mob:getLocalVar("has2Hrd") == 0 then
        mob:useMobAbility(692)

        mob:timer(3000, function(mobArg)
            mobArg:getStatusEffect(tpz.effect.CHAINSPELL):setDuration(0)
        end)

        mob:setLocalVar("has2Hrd", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobDisengage(mob)
    mob:setLocalVar("has2Hrd", 0)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    tpz.abyssea.kiOnMobDeath(mob, player)
end
