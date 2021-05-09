-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Quasilumin
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	-- Teleport the player outside of the Galka tower
	if (npc:getID() == ID.npc.QUASILUMIN[1]) then
		player:setPos(-273.0937, 0, 139.9491, 0)
	end
	
	-- Teleport the player inside of the Galka tower
	if (npc:getID() == ID.npc.QUASILUMIN[2]) then
		player:setPos(-284.9595, 0, 140.1345, 128)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
