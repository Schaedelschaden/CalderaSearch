-----------------------------------
-- Zone: Escha - Ru'Aun
-- NPC: qm (???)
-- Gives Eschan Droplets
-- !pos -14.7846 -34.0001 -465.9527 289
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
	if not (player:hasItem(9148)) then
		player:addTempItem(9148, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, 9148)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end