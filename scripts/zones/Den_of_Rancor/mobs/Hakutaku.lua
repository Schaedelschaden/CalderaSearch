-----------------------------------
-- Area: Den of Rancor (160)
--  Mob: Hakutaku
-- Mob ID: 17433005
-- !pos 24 25 -306 160
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end