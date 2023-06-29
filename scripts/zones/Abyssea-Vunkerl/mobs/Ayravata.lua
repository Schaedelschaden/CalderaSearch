-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Ayravata
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 35)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1707 and math.random() < 10 then -- Voracious Trunk
            mobArg:useMobAbility(1707)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 65

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
