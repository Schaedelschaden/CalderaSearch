-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Mx'ghrah
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.DMGMAGIC, -20)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 100)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1441 then     -- Actinic Burst
            local icon       = tpz.effect.COPY_IMAGE_4
            local numShadows = 4

            mobArg:addStatusEffectEx(tpz.effect.COPY_IMAGE, icon, 2, 0, 900, 0, numShadows)
            mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
            mobArg:setLocalVar("ADD_EFFECT_TIMER", os.time() + 30)
        elseif skillID == 1443 then -- Hexidiscs
            mobArg:addMod(tpz.mod.HASTE_ABILITY, 2500)
            mobArg:setLocalVar("HASTE_TIMER", os.time() + 30)
        end
    end)
end

function onMobFight(mob, target)
    -- Remove the additional effect from Actinic Burst
    if os.time() > mob:getLocalVar("ADD_EFFECT_TIMER") then
        mob:setMobMod(tpz.mobMod.ADD_EFFECT, 0)
    end

    -- Remove the additional effect from Hexidiscs
    if os.time() > mob:getLocalVar("HASTE_TIMER") then
        mob:delMod(tpz.mod.HASTE_ABILITY, 2500)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = math.random(150, 250)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
