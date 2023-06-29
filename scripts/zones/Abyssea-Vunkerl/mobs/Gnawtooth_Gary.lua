-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Gnawtooth Gary
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 50)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 258 then -- Dust Cloud
            mobArg:setLocalVar("TOGGLE_ENSTONE", 1)
            mobArg:setLocalVar("ENSTONE_TIMER", os.time() + 30)
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ENSTONE_TIMER") then
        mob:setLocalVar("TOGGLE_ENSTONE_", 0)
    end
end

function onAdditionalEffect(mob, target, damage)
    local effect = tpz.mob.ae.ENAERO
    local params = {}
        params.chance = 65
        params.power  = math.random(100, 150)

    if mob:getLocalVar("TOGGLE_ENSTONE") == 1 then
        effect        = tpz.mob.ae.ENSTONE
        params.chance = 100
    end

    return tpz.mob.onAddEffect(mob, target, damage, effect, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
