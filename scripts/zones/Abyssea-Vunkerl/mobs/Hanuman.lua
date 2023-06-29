-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Hanuman
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 295 then -- Magic Fruit
            local target = mobArg:getTarget()

            mobArg:resetEnmity(target)
            mobArg:addStatusEffectEx(tpz.effect.HUNDRED_FISTS, tpz.effect.HUNDRED_FISTS, 1, 0, 30)

            local effect = mobArg:getStatusEffect(tpz.effect.HUNDRED_FISTS)

            effect:setFlag(tpz.effectFlag.NO_LOSS_MESSAGE)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SILENCE, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
