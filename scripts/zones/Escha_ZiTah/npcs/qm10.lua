-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm10 (???)
-- (J-9) Located near Bugard and Eft
-- Spawns Vidala
-- !pos 321 0 -120 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2899) and npcUtil.popFromQM(player, npc, ID.mob.VIDALA, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.VIDALA):setPos(321, 0, -120, 0)
		player:delKeyItem(2899)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end