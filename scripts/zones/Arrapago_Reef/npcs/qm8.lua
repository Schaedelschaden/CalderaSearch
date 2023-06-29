-----------------------------------
-- Area: Arrapago Reef
-- NPC: ??? (G-5)
-- Used to spawn Medusa
-- ID: 16999026
-- !pos -451.252 -18.141 451.976 54
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
    -- player:messageSpecial(ID.text.NOTHING_HAPPENS)
	player:PrintToPlayer(string.format("You have the feeling that you need a Ranger's Testimony and a Lamian Bone Key..."),tpz.msg.channel.NS_SAY)
end
