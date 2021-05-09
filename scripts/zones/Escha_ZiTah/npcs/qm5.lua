-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm5 (???)
-- (F-11) Located near Goobbue and Wasps
-- Spawns Tangata Manu / Nosoi
-- !pos -360 0 -440 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2898) and npcUtil.popFromQM(player, npc, ID.mob.TANGATA_MANU, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.TANGATA_MANU):setPos(-360, 0, -440, 0)
		player:delKeyItem(2898)
	elseif (player:hasKeyItem(2913) and npcUtil.popFromQM(player, npc, ID.mob.NOSOI, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.NOSOI):setPos(-360, 0, -440, 0)
		player:delKeyItem(2913)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end