-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Rakshas
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(5)
    mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    if mob:getHPP() < 25 then
        mob:setMod(tpz.mod.REGAIN, 250)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SILENCE, params)
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 286 then -- Addle
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
