-----------------------------------
-- Area: Halvung
-- NPC: Operating Lever
-- !pos -122.6780 -10.0419 222.1037 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
--	printf("Operating_Lever.lua onTrigger NPC ID: [%i]", npc:getID())
    local lever = GetNPCByID(npc:getID())
	local door = GetNPCByID(npc:getID())
	
	-- Opens gate to access Gurfurlur the Menacing's spawn area
	if (lever:getID() == 17031682 or lever:getID() == 17031683) then
		door = GetNPCByID(17031680)
		door:openDoor(15)
	elseif (lever:getID() == 17031686 or lever:getID() == 17031687) then
		door = GetNPCByID(17031684)
		door:openDoor(15)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
