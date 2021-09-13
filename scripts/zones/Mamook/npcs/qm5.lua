-----------------------------------
-- Area: Mamook
-- NPC: ??? (L-9)
-- Spawns Gulool Ja Ja
-- !pos -290.538 17.777 -379.968 65
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	if npcUtil.tradeHas(trade, {1438, 2225}) and npcUtil.popFromQM(player, npc, ID.mob.GULOOL_JA_JA) then -- Ninja's Testimony & Mamook Tanscale Key
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
