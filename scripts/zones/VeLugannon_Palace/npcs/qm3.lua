-----------------------------------
-- Area: VeLugannon Palace
--  NPC: qm3 (???) 17502583
-- Note: Involved in Bartholomew's Knife mini-quest
-- !pos 0.21 0.57 -322.4 177
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 17622) then -- Buccaneer's Knife
        if npc:getLocalVar("PillarCharged") == 1 and math.random(1000) <= 330 then -- 33% chance to obtain on trade.
            player:confirmTrade()
            player:messageSpecial(ID.text.KNIFE_CHANGES_SHAPE, 17622)
--            npcUtil.giveItem(player, 17623) -- Btm. Knife
			player:addItem(17623, 1, 147, 0) -- Adds +1 TH augment to the knife on success
			player:messageSpecial(ID.text.ITEM_OBTAINED, 17623)
        else
            player:messageSpecial(ID.text.NOTHING_HAPPENS)
        end
        npc:setLocalVar("PillarCharged", 0) -- Pillar always loses charge after a morph attempt.
    end
end

function onTrigger(player, npc)
    player:startEvent(2)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end