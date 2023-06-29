-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Sirrush
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 905) -- Only uses Fireball at first

    mob:addMod(tpz.mod.HASTE_GEAR, 2500)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 40)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        -- Uses Fireball or Snowball twice in a row
        if os.time() > mobArg:getLocalVar("DELAY_MOBSKILL") then
            mobArg:useMobAbility(skillID)

            mobArg:setLocalVar("DELAY_MOBSKILL", os.time() + 5)
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if mob:getBattleTime() % 90 == 0 and mob:getLocalVar("SWITCH_SKILL_LIST") == 1 then
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 905)
            mob:setLocalVar("SWITCH_SKILL_LIST", 0)
        elseif mob:getBattleTime() % 90 == 0 and mob:getLocalVar("SWITCH_SKILL_LIST") == 0 then
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 1218)
            mob:setLocalVar("SWITCH_SKILL_LIST", 1)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
