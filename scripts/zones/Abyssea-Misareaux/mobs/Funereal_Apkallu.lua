-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Funereal Apkallu
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.HASTE_ABILITY, 2500)
    mob:addMod(tpz.mod.HASTE_GEAR, 1000)
    mob:addMod(tpz.mod.PARALYZERES, -15)
    mob:addMod(tpz.mod.SLOWRES, -15)
    mob:addMod(tpz.mod.BLINDRES, -15)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
