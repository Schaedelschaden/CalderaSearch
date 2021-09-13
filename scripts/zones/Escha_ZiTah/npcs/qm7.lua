-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm7 (???)
-- (I-10) Located near Bugards
-- Spawns Ferrodon / Shockmaw
-- !pos 243.6 0 -295.39 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2904) and npcUtil.popFromQM(player, npc, ID.mob.FERRODON, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.FERRODON):setPos(243.6, 0, -295.39, 0)
		player:delKeyItem(2904)
	-- elseif (player:hasKeyItem(2918) and npcUtil.popFromQM(player, npc, ID.mob.SHOCKMAW, {claim = true, hide = 30})) then
		-- GetMobByID(ID.mob.SHOCKMAW):setPos(243.6, 0, -295.39, 0)
		-- player:delKeyItem(2918)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end