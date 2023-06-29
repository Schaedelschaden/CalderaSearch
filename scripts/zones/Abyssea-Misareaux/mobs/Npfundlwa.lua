-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Npfundlwa
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 65)
    mob:addMod(tpz.mod.REGAIN, 150)
    mob:addMod(tpz.mod.ACC, 150)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 258 then -- Dust Cloud
            local target = mobArg:getTarget()

            mobArg:resetEnmity(target)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 25
        params.power  = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BLIND, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
