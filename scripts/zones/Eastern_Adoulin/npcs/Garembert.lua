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
	player:PrintToPlayer(string.format("Garembert : An adventurer? You should speak with our captain. I'd bet she has a job right up your alley."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
