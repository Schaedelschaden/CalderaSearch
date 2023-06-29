-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Nehebkau
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 50)
    mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 50)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        local target = mobArg:getTarget()

        if skillID == 376 then -- Foul Breath
            mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

            mobArg:setMobMod(tpz.mobMod.AUTO_SPIKES, 0)
            mobArg:delStatusEffectSilent(tpz.effect.ICE_SPIKES)
            mobArg:delStatusEffectSilent(tpz.effect.SHOCK_SPIKES)
        elseif skillID == 377 then -- Frost Breath
            mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 0)
            mobArg:delStatusEffectSilent(tpz.effect.SHOCK_SPIKES)

            mobArg:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
            mobArg:addStatusEffect(tpz.effect.ICE_SPIKES, 75, 0, 0)
            mobArg:getStatusEffect(tpz.effect.ICE_SPIKES):setFlag(tpz.effectFlag.DEATH)
        elseif skillID == 378 then -- Thunderbolt
            mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 0)
            mobArg:delStatusEffectSilent(tpz.effect.ICE_SPIKES)

            mobArg:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
            mobArg:addStatusEffect(tpz.effect.SHOCK_SPIKES, 75, 0, 0)
            mobArg:getStatusEffect(tpz.effect.SHOCK_SPIKES):setFlag(tpz.effectFlag.DEATH)
        end

        mobArg:setLocalVar("BREATH_COUNTER", mobArg:getLocalVar("BREATH_COUNTER") + 1)

        if os.time() > mobArg:getLocalVar("BREATH_DELAY") then
            local skillUses = math.random(1, 2)

            for i = 1, skillUses do
                mobArg:useMobAbility(skillID)
            end

            mobArg:setLocalVar("BREATH_DELAY", os.time() + 10)
            mobArg:setLocalVar("BREATH_MAX_USE", 1 + skillUses)
        end

        if mobArg:getLocalVar("BREATH_COUNTER") >= mobArg:getLocalVar("BREATH_MAX_USE") then
            mobArg:setLocalVar("BREATH_COUNTER", 0)
            mobArg:setLocalVar("BREATH_MAX_USE", 0)
            mobArg:resetEnmity(target)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 150

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
