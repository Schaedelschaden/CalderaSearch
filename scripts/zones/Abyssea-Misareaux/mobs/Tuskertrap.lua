-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Tuskertrap
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.PARALYZERES, 100)
    mob:addMod(tpz.mod.HASTE_GEAR, 2500)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 65
        params.power  = 505 - (500 * (mob:getHPP() / 100))

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
