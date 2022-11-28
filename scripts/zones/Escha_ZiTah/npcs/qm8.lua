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
    if (player:hasKeyItem(tpz.keyItem.REVETAURS_HORN) and npcUtil.popFromQM(player, npc, ID.mob.REVETAUR, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.REVETAUR):setPos(461, 0, -279.4, 0)
        player:delKeyItem(tpz.keyItem.REVETAURS_HORN)
    elseif (player:hasKeyItem(tpz.keyItem.IONOSS_WEBBING) and npcUtil.popFromQM(player, npc, ID.mob.IONIS, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.IONIS):setPos(461, 0, -279.4, 0)
        player:delKeyItem(tpz.keyItem.IONOSS_WEBBING)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
