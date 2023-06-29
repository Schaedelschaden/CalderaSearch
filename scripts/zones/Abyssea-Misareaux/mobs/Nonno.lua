-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Nonno
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1588 then -- Scream (Terror)
            if mobArg:getHPP() > 25 then
                local addEffect1 = math.random(1, 3)
                local addEffect2 = math.random(1, 3)

                while addEffect2 == addEffect1 do
                    addEffect2 = math.random(1, 3)
                end

                mobArg:setLocalVar("SCREAM_SPECEFFECT_"..addEffect1, 1)
                mobArg:setLocalVar("SCREAM_SPECEFFECT_"..addEffect2, 1)
            else
                mobArg:setLocalVar("SCREAM_SPECEFFECT_1", 1)
                mobArg:setLocalVar("SCREAM_SPECEFFECT_2", 1)
                mobArg:setLocalVar("SCREAM_SPECEFFECT_3", 1)
            end

            mobArg:setLocalVar("SCREAM_SPECEFFECT_DURATION", os.time() + 45)
        end
    end)

    mob:addListener("MAGIC_TAKE", "BLIND_INFLICTED", function(mobArg, caster, spell)
        if
            mobArg:getLocalVar("BLIND_BONUS") == 0 and
            spell:tookEffect()
        then
            if spell:getID() == 254 then -- Blind
                mobArg:addMod(tpz.mod.ACC, -50)
                mobArg:setLocalVar("BLIND_BONUS", 50)
            elseif spell:getID() == 276 then -- Blind II
                mobArg:addMod(tpz.mod.ACC, -90)
                mobArg:setLocalVar("BLIND_BONUS", 90)
            end
        end
    end)

    mob:addListener("EFFECT_LOSE", "BLIND_WEAR_OFF", function(mobArg, effect)
        if effect:getType() == tpz.effect.BLINDNESS then
            mobArg:delMod(tpz.mod.ACC, -mobArg:getLocalVar("BLIND_BONUS"))
            mobArg:setLocalVar("BLIND_BONUS", 0)
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local allianceList = target:getAlliance()
        local playerName   = {}
        local targ

        for i, v in ipairs(allianceList) do
            local distance = mob:checkDistance(v)

            if distance <= 15 then
                if
                    mob:getLocalVar("SCREAM_SPECEFFECT_1") == 1 and
                    os.time() < mob:getLocalVar("SCREAM_SPECEFFECT_DURATION")
                then
                    -- Addle Aura
                    v:addStatusEffectEx(tpz.effect.ADDLE, tpz.effect.ADDLE, 50, 0, 15)
                end

                if
                    mob:getLocalVar("SCREAM_SPECEFFECT_2") == 1 and
                    os.time() < mob:getLocalVar("SCREAM_SPECEFFECT_DURATION")
                then
                    -- Slow Aura
                    v:addStatusEffectEx(tpz.effect.SLOW, tpz.effect.SLOW, 3000, 0, 15)
                end

                if
                    mob:getLocalVar("SCREAM_SPECEFFECT_3") == 1 and
                    os.time() < mob:getLocalVar("SCREAM_SPECEFFECT_DURATION")
                then
                   -- Additional Effect: Enstone
                   mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
                end
            end
        end

        if os.time() > mob:getLocalVar("SCREAM_SPECEFFECT_DURATION") then
            mob:setLocalVar("SCREAM_SPECEFFECT_1", 0)
            mob:setLocalVar("SCREAM_SPECEFFECT_2", 0)
            mob:setLocalVar("SCREAM_SPECEFFECT_3", 0)
            mob:setMobMod(tpz.mobMod.ADD_EFFECT, 0)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = math.random(150, 200)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("BLIND_INFLICTED")
    mob:removeListener("BLIND_WEAR_OFF")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("BLIND_INFLICTED")
    mob:removeListener("BLIND_WEAR_OFF")
end
