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
    if (player:hasKeyItem(tpz.keyItem.AGLAOPHOTIS_BUD) and npcUtil.popFromQM(player, npc, ID.mob.AGLAOPHOTIS, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.AGLAOPHOTIS):setPos(-365, 0, 439, 0)
        player:delKeyItem(tpz.keyItem.AGLAOPHOTIS_BUD)
    elseif (player:hasKeyItem(tpz.keyItem.UMDHLEBIS_FLOWER) and npcUtil.popFromQM(player, npc, ID.mob.UMDHLEBI, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.UMDHLEBI):setPos(-365, 0, 439, 0)
        player:delKeyItem(tpz.keyItem.UMDHLEBIS_FLOWER)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
