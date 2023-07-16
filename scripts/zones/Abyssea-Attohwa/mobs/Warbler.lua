-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Warbler
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

local AURA_DISTANCE = 4.5

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:speed(100)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local allianceList = target:getAlliance()
        local playerName   = {}
        local targ
        
        -- Silence, Amnesia, and Poison Aura
        for i, v in ipairs(allianceList) do
            if v:isPC() then
                playerName[i] = v:getName()
                targ = GetPlayerByName(playerName[i])

                if mob:checkDistance(targ) <= AURA_DISTANCE then
                    targ:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 10)
                    targ:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 10)
                    targ:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 40, 3, 10)
                end
            elseif v:getObjType() == tpz.objType.TRUST then
                if mob:checkDistance(v) <= AURA_DISTANCE then
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 10)
                    v:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 10)
                    v:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 40, 3, 10)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance   = 70
        params.duration = math.random(7, 10)

    mob:resetEnmity(target)

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
