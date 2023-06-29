-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Minax Bugard
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:speed(90)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.DMGMAGIC, 15)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1863 then -- Heavy Bellow
            -- Reset enmity on Minax Bugard's current target
            local target = mobArg:getTarget()

            mobArg:resetEnmity(target)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 33
        params.power  = 1

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
