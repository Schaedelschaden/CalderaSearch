-----------------------------------
-- Snow Maiden
-- !pos 378.482 -11.784 -72.563 5
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setDropID(0)
    mob:setLocalVar("SPAWN_ADDS_HPP", 90)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        local hpp = (mob:getHP() / mob:getMaxHP()) * 100

        if
            hpp <= mob:getLocalVar("SPAWN_ADDS_HPP") and
            mob:getLocalVar("SPAWN_ADDS_HPP") > 10 and
            mob:getLocalVar("SPAWN_ADDS_PROTECT") == 0
        then
            SpawnMob(16797806)
            SpawnMob(16797807)
            SpawnMob(16797808)

            mob:setLocalVar("SPAWN_ADDS_HPP", mob:getLocalVar("SPAWN_ADDS_HPP") - 10)
            mob:setLocalVar("SPAWN_ADDS_PROTECT", 1)
        end

        local snowballs =
        {
            GetMobByID(ID.mob.SNOW_MAIDEN - 3),
            GetMobByID(ID.mob.SNOW_MAIDEN - 2),
            GetMobByID(ID.mob.SNOW_MAIDEN - 1),
        }

        for i = 1, 3 do
            snowballs[i]:updateEnmity(target)
        end

        if
            snowballs[1]:isAlive() or
            snowballs[2]:isAlive() or
            snowballs[3]:isAlive()
        then
            mob:setMod(tpz.mod.UDMGPHYS, -100)
        else
            mob:setMod(tpz.mod.UDMGPHYS, 0)
            mob:setLocalVar("SPAWN_ADDS_PROTECT", 0)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 1)
    end
end

function onMobDeath(mob, player, isKiller)
    SpawnMob(16797810)

    local frost = GetMobByID(ID.mob.FATHER_FROST)

    frost:updateEnmity(player)
end

function onMobDespawn(mob)
end
