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
    if (player:hasKeyItem(tpz.keyItem.TANGATAS_WING) and npcUtil.popFromQM(player, npc, ID.mob.TANGATA_MANU, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.TANGATA_MANU):setPos(-360, 0, -440, 0)
        player:delKeyItem(tpz.keyItem.TANGATAS_WING)
    elseif (player:hasKeyItem(tpz.keyItem.NOSOIS_FEATHER) and npcUtil.popFromQM(player, npc, ID.mob.NOSOI, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.NOSOI):setPos(-360, 0, -440, 0)
        player:delKeyItem(tpz.keyItem.NOSOIS_FEATHER)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
