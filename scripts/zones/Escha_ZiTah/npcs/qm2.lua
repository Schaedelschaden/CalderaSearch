-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm2 (???)
-- (F-6) Located near Shadow Dragons and Puks
-- Spawns Aglaophotis / Umdhlebi
-- !pos -365 0 439 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
	if (player:hasKeyItem(2897) and npcUtil.popFromQM(player, npc, ID.mob.AGLAOPHOTIS, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.AGLAOPHOTIS):setPos(-365, 0, 439, 0)
		player:delKeyItem(2897)
	elseif (player:hasKeyItem(2916) and npcUtil.popFromQM(player, npc, ID.mob.UMDHLEBI, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.UMDHLEBI):setPos(-365, 0, 439, 0)
		player:delKeyItem(2916)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end