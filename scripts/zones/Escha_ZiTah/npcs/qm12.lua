-----------------------------------
-- Zone: Escha - Zi'Tah
--  NPC: qm12 (???)
-- (J-12) Located near Yztarg and Opo-opo
-- Spawns Gestalt
-- !pos 396 0 -641 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
    if (player:hasKeyItem(tpz.keyItem.GESTALTS_RETINA) and npcUtil.popFromQM(player, npc, ID.mob.GESTALT, {claim = true, hide = 30})) then
        GetMobByID(ID.mob.GESTALT):setPos(396, 0, -641, 0)
        player:delKeyItem(tpz.keyItem.GESTALTS_RETINA)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end
