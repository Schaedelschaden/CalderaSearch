-----------------------------------
-- Father Frost
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
            GetMobByID(ID.mob.FATHER_FROST - 4),
            GetMobByID(ID.mob.FATHER_FROST - 3),
            GetMobByID(ID.mob.FATHER_FROST - 2),
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
    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Go speak to the Bestiary bookshelf in the library for a seasonal prize!"), tpz.msg.channel.NS_LINKSHELL3)

    player:setCharVar("Seasonal_Reward", 1)
end

function onMobDespawn(mob)
end
