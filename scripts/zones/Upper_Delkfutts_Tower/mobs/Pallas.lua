-----------------------------------
-- Area: Upper Delkfutt's Tower (158)
--   NM: Pallas
-- Mob ID: 17424444
-- !pos -300 -159 21 158
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end