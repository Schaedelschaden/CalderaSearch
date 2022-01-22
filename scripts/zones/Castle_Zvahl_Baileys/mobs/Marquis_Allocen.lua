-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Allocen
-- Mob ID: 17436913
-- !pos -44 -5 37.5 161
-----------------------------------

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName = mobName:sub(1, 18)
	local KillCounter = player:getCharVar("KillCounter_"..shortName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- Set Marquis_Allocen's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400))
end