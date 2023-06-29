-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Hrosshvalur
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    -- mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)    -- Forces the mob to stand back and shoot its target
    mob:setMobMod(tpz.mobMod.SPECIAL_SKILL, 313) -- Sets the mob's "ranged" attack to Counterspore
    mob:setMobMod(tpz.mobMod.SPECIAL_COOL, 8)    -- Reduces the time between special attacks to 8 seconds

    mob:addMod(tpz.mod.FASTCAST, 75)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 313 then -- Counterspore
            local target = mobArg:getTarget()

            mobArg:lowerEnmity(target, 25)
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
