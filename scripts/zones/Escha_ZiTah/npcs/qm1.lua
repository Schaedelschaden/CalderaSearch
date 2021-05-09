-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm1 (???)
-- (F-5) Located near Shadow Dragons and Puks
-- Spawns Cunnast
-- !pos -238 0 612 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
	if (player:hasKeyItem(2902) and npcUtil.popFromQM(player, npc, ID.mob.CUNNAST, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.CUNNAST):setPos(-238, 0, 612, 0)
		player:delKeyItem(2902)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end