-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Duke Haborym
-- Mob ID: 17436923
-- !pos -93 -4.5 35 161
-----------------------------------

function onMobSpawn(mob)
	mob:setMobLevel(115)
end

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
    -- Set Duke_Haborym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400))
end