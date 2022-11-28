-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm4 (???)
-- (H-10) Located near Skeletons, Corse, and Vultures
-- Spawns Gulltop / Brittlis
-- !pos -1.39 0 -163 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
    if (player:hasKeyItem(tpz.keyItem.GULLTOPS_SHELL) and npcUtil.popFromQM(player, npc, ID.mob.GULLTOP, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.GULLTOP):setPos(-1.39, 0, -163, 0)
        player:delKeyItem(tpz.keyItem.GULLTOPS_SHELL)
    elseif (player:hasKeyItem(tpz.keyItem.BRITTLISS_RING) and npcUtil.popFromQM(player, npc, ID.mob.BRITTLIS, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.BRITTLIS):setPos(-1.39, 0, -163, 0)
        player:delKeyItem(tpz.keyItem.BRITTLISS_RING)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
