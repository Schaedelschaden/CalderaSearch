-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm8 (???)
-- (K-10) Located near Bugards and Efts
-- Spawns Revetaur / Ionis
-- !pos 461 0 -279.4 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
    
end

function onTrigger(player, npc)
    if (player:hasKeyItem(2903) and npcUtil.popFromQM(player, npc, ID.mob.REVETAUR, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.REVETAUR):setPos(461, 0, -279.4, 0)
		player:delKeyItem(2903)
	elseif (player:hasKeyItem(2911) and npcUtil.popFromQM(player, npc, ID.mob.IONIS, {claim = true, hide = 30})) then
		GetMobByID(ID.mob.IONIS):setPos(461, 0, -279.4, 0)
		player:delKeyItem(2911)
	else
		player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
	end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end