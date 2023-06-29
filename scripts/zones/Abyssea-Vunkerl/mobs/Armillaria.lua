-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Armillaria
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.BLINDRES, 100)
    mob:addMod(tpz.mod.PARALYZERES, 100)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if mobArg:getHPP() <= 30 then
            if skillID == 309 then     -- Spore
                mobArg:setLocalVar("AURA", 1)
            elseif skillID == 314 then -- Silence Gas
                mobArg:setLocalVar("AURA", 2)
            elseif skillID == 315 then -- Dark Spore
                mobArg:setLocalVar("AURA", 3)
            end
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 100 - mob:getHPP())

        -- Uses the following "Shroom" attacks only once after dropping below a specific HP range
        if mob:getHPP() <= 75 and mob:getLocalVar("SHROOM_LEVEL") == 0 then
            mob:useMobAbility(310) -- Queasyshroom
            mob:AnimationSub(1)
            mob:setLocalVar("SHROOM_LEVEL", 1)
        elseif mob:getHPP() <= 50 and mob:getLocalVar("SHROOM_LEVEL") == 1 then
            mob:useMobAbility(311) -- Numbshroom
            mob:AnimationSub(2)
            mob:setLocalVar("SHROOM_LEVEL", 2)
        elseif mob:getHPP() <= 25 and mob:getLocalVar("SHROOM_LEVEL") == 2 then
            mob:useMobAbility(312) -- Shakeshroom
            mob:AnimationSub(3)
            mob:setLocalVar("SHROOM_LEVEL", 3)
        end

        -- Handle auras
        local allianceList = target:getAlliance()
        local playerName   = {}
        local targ

        for i, v in ipairs(allianceList) do
            local distance = mob:checkDistance(v)

            if distance <= 15 then
                if mob:getLocalVar("AURA") == 1 then     -- Spore
                    v:addStatusEffectEx(tpz.effect.PARALYSIS, tpz.effect.PARALYSIS, 35, 0, 15)
                elseif mob:getLocalVar("AURA") == 2 then -- Silence Gas
                    v:addStatusEffectEx(tpz.effect.BLINDNESS, tpz.effect.BLINDNESS, 100, 0, 15)
                elseif mob:getLocalVar("AURA") == 3 then -- Dark Spore
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 15)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
