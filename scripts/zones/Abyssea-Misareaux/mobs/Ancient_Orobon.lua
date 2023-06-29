-----------------------------------
-- Area: Abyssea - Misareaux
--  Mob: Ancient Orobon
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    -- mob:addListener("CRITICAL_TAKE", "OROBON_CRITICAL_TAKE", function(mob)
        -- if math.random(100) < 20 and mob:AnimationSub() == 0 then
            -- mob:AnimationSub(1)
        -- end
    -- end)
end

function onMobFight(mob)
end

function onMobDeath(mob, player, isKiller)
    -- mob:removeListener("OROBON_CRITICAL_TAKE")
end
