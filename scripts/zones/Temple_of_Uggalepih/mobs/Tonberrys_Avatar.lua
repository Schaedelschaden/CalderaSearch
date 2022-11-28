-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry's Avatar
-----------------------------------
mixins = {require("scripts/mixins/families/avatar")}
-----------------------------------

function onMobRoam(mob)
    -- Tonberry Kinq
    if mob:getID() == 17428679 then
        mob:hideName(false)
        mob:untargetable(false)
        mob:setUnkillable(false)
    end
end

function onMobSpawn(mob)
    -- Tonberry Kinq
    if mob:getID() == 17428679 then
        mob:setMobLevel(135)
    end
end

function onMobDeath(mob, player, isKiller)
end
