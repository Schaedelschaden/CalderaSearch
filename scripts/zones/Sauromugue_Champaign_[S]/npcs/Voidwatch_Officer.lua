-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Voidwatch Officer
-- Issues voidstones
-- !pos -439.373 0.412 332.265 98
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/voidwatch")
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	tpz.voidwatch.onTriggerCaldera(player, npc)
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end