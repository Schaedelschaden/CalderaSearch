-----------------------------------
-- Area: Cirdas Caverns
-- NPC: Scalable Area
-----------------------------------
local ID = require("scripts/zones/Cirdas_Caverns/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
	-- if (player:hasKeyItem(2388)) then
		-- player:messageSpecial(ID.text.CLIMB_DOWN_UP)
	-- else
		-- player:messageSpecial(ID.text.CLIMBING_POSSIBLE, 2388)
	-- end
	local npcID = npc:getID()
	
	if (npcID == 17883954) then
		player:setPos(-216.8494, 20.1004, -259.7393, 0)
	end
end