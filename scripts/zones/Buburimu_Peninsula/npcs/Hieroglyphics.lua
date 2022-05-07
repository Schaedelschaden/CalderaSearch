-----------------------------------
-- Area: Buburimu_Peninsula
--  NPC: Hieroglyphics
-- Dynamis Buburimu Enter
-- !pos 163 0 -174 118
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	if not (player:hasKeyItem(tpz.ki.PRISMATIC_HOURGLASS)) then
		player:PrintToPlayer(string.format("You must be in possession of a Prismatic Hourglass to enter Dreamworld.", tpz.msg.channel.SYSTEM_3))
		return
	end

	if (player:getCharVar("KillCounter_Goji") >= 1 and player:getCharVar("KillCounter_Cherufe") >= 1 and player:getCharVar("KillCounter_Yatagarasu") >= 1 and
		player:getCharVar("KillCounter_Agathos") >= 1 and player:getCharVar("KillCounter_Gugalanna") >= 1 and player:getCharVar("KillCounter_Taweret") >= 1) then
		dynamis.entryNpcOnTrigger(player, npc)
	else
		player:PrintToPlayer(string.format("It seems the six Jeuno Voidwatch guardians deny you entrance.", tpz.msg.channel.SYSTEM_3))
	end
   -- dynamis.entryNpcOnTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
   dynamis.entryNpcOnEventFinish(player, csid, option)
end