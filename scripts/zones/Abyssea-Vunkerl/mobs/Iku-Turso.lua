-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Iku-Turso
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 462 then -- Maelstrom
            mobArg:setLocalVar("AURA_SILENCE", os.time() + math.random(15, 30))
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Handle aura
        if os.time() < mob:getLocalVar("AURA_SILENCE") then
            local allianceList = target:getAlliance()
            local playerName   = {}
            local targ

            for i, v in ipairs(allianceList) do
                local distance = mob:checkDistance(v)

                if distance <= 15 then
                    v:delStatusEffectSilent(tpz.effect.SILENCE)
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 4)
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
