-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Vesca
-- Type: Bayld Trade
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Craggy Bluff : I worry about Captain Vesca. Her obsession with that damned green dust is insanity."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
