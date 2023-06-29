-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Manohra
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.BINDRES, 100)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1445 then -- Damnation Dive
            -- Trigger a Silence aura for 30 seconds
            mobArg:setLocalVar("AURA_SILENCE", os.time() + 30)
        elseif skillID == 1576 then -- Helldive
            mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
            mobArg:addMod(tpz.mod.HASTE_ABILITY, 2500)

            -- Remove the additional effect after 30 seconds
            mobArg:timer(30000, function(mob)
                mobArg:setMobMod(tpz.mobMod.ADD_EFFECT, 0)
                mobArg:delMod(tpz.mod.HASTE_ABILITY, 2500)
            end)
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
                if os.time() < mob:getLocalVar("AURA_SILENCE") then
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 15)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 105

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, params)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
