-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm11 (???)
-- (K-10) Located near Yztarg and Opo-opo
-- Spawns Vyala / Fleetstalker
-- !pos 596.7 0 -163.8 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2906) and npcUtil.popFromQM(player, npc, ID.mob.VYALA, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.VYALA):setPos(596.7, 0, -163.8, 0)
		player:delKeyItem(2906)
	elseif (player:hasKeyItem(2917) and npcUtil.popFromQM(player, npc, ID.mob.FLEETSTALKER, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.FLEETSTALKER):setPos(596.7, 0, -163.8, 0)
		player:delKeyItem(2917)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end