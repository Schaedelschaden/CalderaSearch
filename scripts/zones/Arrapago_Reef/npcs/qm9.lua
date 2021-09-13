-----------------------------------
-- Area: Arrapago Reef
-- NPC: ??? (K-10)
-- Involved in Quest: "The Die is Cast"
-- !pos 311 -3.88 170
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end