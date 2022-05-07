-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Skahnowa
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.UDMGPHYS, -100)
	mob:setMod(tpz.mod.UDMGBREATH, -100)
	mob:setMod(tpz.mod.UDMGMAGIC, -100)
	mob:setMod(tpz.mod.UDMGRANGE, -100)
end

function onMobFight(mob, target)
	local mainLevel = target:getMainLvl()
		
	if (target:isPC()) then
		mainLevel = mainLevel + target:getItemLevel()
	end
	
	if (mainLevel > mob:getMainLvl()) then
		mob:setMobLevel(mainLevel)
	end
end

function onMobDeath(mob, player, isKiller)
    player:setCharVar("Skahnowa_Killed", 1)
	player:PrintToPlayer(string.format("Your quest is complete! Return to <NPC> to claim your reward!"), tpz.msg.channel.NS_LINKSHELL3)
end