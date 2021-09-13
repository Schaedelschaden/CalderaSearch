-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm9 (???)
-- (K-11) Located near Yztarg and Opo-opo
-- Spawns Angrboda / Kamohoalii
-- !pos 519 0 -479.5 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2901) and npcUtil.popFromQM(player, npc, ID.mob.ANGRBODA, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.ANGRBODA):setPos(519, 0, -479.5, 0)
		player:delKeyItem(2901)
	-- elseif (player:hasKeyItem(2915) and npcUtil.popFromQM(player, npc, ID.mob.KAMOHOALII, {claim = true, hide = 30})) then
		-- GetMobByID(ID.mob.KAMOHOALII):setPos(519, 0, -479.5, 0)
		-- player:delKeyItem(2915)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end