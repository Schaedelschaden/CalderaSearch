-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Bukhis
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ICERES, 150)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 65)
    mob:addMod(tpz.mod.FASTCAST, 50)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 2640 then -- Ruinous Scythe
            mobArg:setMod(tpz.mod.HUMANOID_KILLER, 25)
            mobArg:setLocalVar("KILLER_EFFECT_TIMER", os.time() + 30)
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("KILLER_EFFECT_TIMER") then
        mob:setMod(tpz.mod.HUMANOID_KILLER, 0)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
