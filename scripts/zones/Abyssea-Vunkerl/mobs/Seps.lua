-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Seps
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.WINDRES, 250)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 70
        params.power  = math.random(100, 200)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
