-----------------------------------
-- Area: Arrapago Reef
-- NPC: ??? (G-8)
-- Involved in Quest: "Get the Picture"
-- !pos 326 -0.7 244
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end