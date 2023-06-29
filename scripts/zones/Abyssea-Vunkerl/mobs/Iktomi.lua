-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Iktomi
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 65)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 811 then -- Acid Spray
            mobArg:setLocalVar("AURA_PARALYZE", os.time() + 30)
        elseif skillID == 959 then -- Sickle Slash
            local target = mobArg:getTarget()
            local chance = math.random(0, 100)

            mobArg:delMod(tpz.mod.ATT, mobArg:getLocalVar("ATTACK_BONUS"))
            mobArg:setLocalVar("ATTACK_BONUS", 0)
            
            if chance <= 15 then
                mobArg:resetEnmity(target)
            elseif chance > 15 and chance <= 50 then
                mobArg:lowerEnmity(target, 33)
            end
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Handle aura
        if os.time() < mob:getLocalVar("AURA_PARALYZE") then
            local allianceList = target:getAlliance()
            local playerName   = {}
            local targ

            for i, v in ipairs(allianceList) do
                local distance = mob:checkDistance(v)

                if distance <= 15 then
                    v:delStatusEffectSilent(tpz.effect.PARALYSIS)
                    v:addStatusEffectEx(tpz.effect.PARALYSIS, tpz.effect.PARALYSIS, 30, 0, 4)
                end
            end
        end

        -- Increase attack until Sickle Slash resets it
        if mob:getLocalVar("ATTACK_BONUS") < 600 then
            mob:addMod(tpz.mod.ATT, 30)
            mob:setLocalVar("ATTACK_BONUS", mob:getLocalVar("ATTACK_BONUS") + 30)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = math.random(80, 120)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
