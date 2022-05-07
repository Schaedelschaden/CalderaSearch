-----------------------------------
-- Area: Upper Delkfutt's Tower (158)
--   NM: Alkyoneus
-- Mob ID: 17424480
-- !pos -300 -175 22 158
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_DESPAWN, 1)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 86400)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	
end