-----------------------------------
-- Area: Arrapago Reef
-- NPC: ??? (G-5)
-- Used to spawn Medusa
-- !pos -451.252 -18.141 451.976
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	if npcUtil.tradeHas(trade, {1436, 2220}) and npcUtil.popFromQM(player, npc, ID.mob.MEDUSA) then -- Ranger's Testimony & Lamian Bone Key
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end