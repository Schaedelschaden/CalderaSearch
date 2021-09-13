-----------------------------------
-- Area: Dho Gates
--  NPC: Scalable Area
-----------------------------------
local ID = require("scripts/zones/Dho_Gates/IDs")
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
	
	if (npcID == 17891720) then
		player:setPos(-383.9891, -39.9390, 182.8513, 126)
	elseif (npcID == 17891722) then
		player:setPos(-464.9403, -50.1754, 60.3690, 51)
	end
end