-----------------------------------
-- Area: Den of Rancor
--  NPC: Lantern (Blue)
-- !pos -136.840 4.742 -173.040 160
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/zones/Den_of_Rancor/globals")
-----------------------------------

function onTrade(player, npc, trade)
    -- DEN_OF_RANCOR.onTradeLanternBoss(player, npc, trade)
end

function onTrigger(player, npc)
    -- DEN_OF_RANCOR.onTriggerLantern(player, npc)
	npc:openDoor(LANTERNS_STAY_LIT) -- light lantern

	local total = GetNPCByID(ID.npc.LANTERN_OFFSET + 9):getAnimation() +
				  GetNPCByID(ID.npc.LANTERN_OFFSET + 10):getAnimation()

	if total == 17 then
		player:messageSpecial(ID.text.LANTERN_OFFSET + 9)
	elseif total == 16 then
		player:messageSpecial(ID.text.LANTERN_OFFSET + 12)
		for i = ID.npc.LANTERN_OFFSET + 9, ID.npc.LANTERN_OFFSET + 10 do
			local lantern = GetNPCByID(i)
			lantern:closeDoor(1)
			lantern:openDoor(30)
		end
		GetNPCByID(ID.npc.LANTERN_OFFSET + 11):openDoor(30)
	end
end