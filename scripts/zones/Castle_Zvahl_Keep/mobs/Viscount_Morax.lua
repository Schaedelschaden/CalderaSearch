-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Viscount Morax
-- Mob ID: 17440975
-- !pos -380 -52 -121 162
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 356)
    player:addTitle(tpz.title.HELLSBANE)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName = mobName:sub(1, 18)
	local KillCounter = player:getCharVar("KillCounter_"..shortName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end