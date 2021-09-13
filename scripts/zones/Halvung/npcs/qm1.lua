-----------------------------------
-- Area: Halvung
-- NPC: ??? (Previously spawned Big Bomb)
-- Repurposed to spawn Gurgurlur the Menacing 
-- !pos -59.9163 -23.8305 0.7668 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    -- if npcUtil.tradeHas(trade, 2384) and npcUtil.popFromQM(player, npc, ID.mob.BIG_BOMB) then -- Smokey Flask
        -- player:confirmTrade()
    -- end
	if npcUtil.tradeHas(trade, {1427, 2221}) and npcUtil.popFromQM(player, npc, ID.mob.GURFURLUR_THE_MENACING) then -- Monk's Testimony & Halvung Shakudo Key
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    -- player:messageSpecial(ID.text.BLUE_FLAMES)
	player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
