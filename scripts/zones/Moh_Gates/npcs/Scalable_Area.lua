-----------------------------------
-- Area: Moh Gates
--  NPC: Scalable Area
-----------------------------------
local ID = require("scripts/zones/Moh_Gates/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
	-- if (player:hasKeyItem(2388)) then
		-- player:messageSpecial(ID.text.CLIMB_DOWN_UP)
	-- else
		-- player:messageSpecial(ID.text.CLIMBING_POSSIBLE, 2388)
	-- end
--	printf("Scalable_Area.lua onTrigger NPC ID: [%i]", npc:getID())
	if (npc:getID() == 17879432) then
		player:setPos(299.739, 29.975, -265.544)
	elseif (npc:getID() == 17879434) then
		player:setPos(180.087, 30.124, -344.565, 66)
	end
end