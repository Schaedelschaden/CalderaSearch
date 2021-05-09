-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm6 (???)
-- (H-11) Located near Snapweed and Wasps
-- Spawns Lustful Lydia / Sensual Sandy
-- !pos -6.69 0 -443.5 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2896) and npcUtil.popFromQM(player, npc, ID.mob.LUSTFUL_LYDIA, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.LUSTFUL_LYDIA):setPos(-6.69, 0, -443.5, 0)
		player:delKeyItem(2896)
	elseif (player:hasKeyItem(2912) and npcUtil.popFromQM(player, npc, ID.mob.SENSUAL_SANDY, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.SENSUAL_SANDY):setPos(-6.69, 0, -443.5, 0)
		player:delKeyItem(2912)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end