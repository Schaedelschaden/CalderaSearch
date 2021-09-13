-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm3 (???)
-- (H-8) Located near Skeletons and Corse
-- Spawns Wepwawet / Urmahlulu
-- !pos 35 0 126 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2895) and npcUtil.popFromQM(player, npc, ID.mob.WEPWAWET, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.WEPWAWET):setPos(35, 0, 126, 0)
		player:delKeyItem(2895)
	-- elseif (player:hasKeyItem(2919) and npcUtil.popFromQM(player, npc, ID.mob.URMAHLULU, {claim = true, hide = 30})) then
		-- GetMobByID(ID.mob.URMAHLULU):setPos(35, 0, 126, 0)
		-- player:delKeyItem(2919)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end