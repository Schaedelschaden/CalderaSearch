-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Whiro
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.WINDRES, 85)
    mob:addMod(tpz.mod.EARTHRES, 85)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "CYCLOTAIL_USED", function(mobArg, skillID)
        local counter = mobArg:getLocalVar("CYCLOTAIL_COUNTER")
        local maxUses = 5
        local chance  = math.random(1, 100)

        -- Cyclotail
        if
            skillID == 519 and
            counter < maxUses and
            chance <= 70
        then
            counter = counter + 1

            mobArg:setLocalVar("CYCLOTAIL_COUNTER", counter)
            mobArg:useMobAbility(519)
        elseif
            skillID == 519 and
            chance > 70
        then
            mobArg:timer(5000, function(mob)
                mob:setLocalVar("CYCLOTAIL_COUNTER", 0)
            end)
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
    mob:removeListener("CYCLOTAIL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("CYCLOTAIL_USED")
end
