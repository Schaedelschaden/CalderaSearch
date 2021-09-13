-----------------------------------
-- Area: Mamook
-- NPC: ??? (L-9)
-- Involved in Quest: "Give Peace a Chance"
-- !pos 347 -12 -256 65
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
