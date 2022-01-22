-----------------------------------
-- Area: Davoi (149)
--   NM: Dirtyhanded Gochakzuk
-- Mob ID: 17387945
-- !pos 56.2 -12.1 -152.9 149
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
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