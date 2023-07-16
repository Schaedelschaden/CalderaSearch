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
        local chance = math.random(1000)

        if npc:getLocalVar("PillarCharged") == 1 and chance <= 330 then -- 33% chance to obtain on trade.
            player:confirmTrade()
            player:messageSpecial(ID.text.KNIFE_CHANGES_SHAPE, 17622)
--            npcUtil.giveItem(player, 17623) -- Btm. Knife
			player:addItem(17623, 1, 147, 0) -- Adds +1 TH augment to the knife on success
			player:messageSpecial(ID.text.ITEM_OBTAINED, 17623)

            npc:setLocalVar("PillarCharged", 0) -- Pillar always loses charge after a morph attempt.
        elseif npc:getLocalVar("PillarCharged") == 1 and chance > 330 then
            player:PrintToPlayer(string.format("The pillar's energy discharges with no effect!"),tpz.msg.channel.SYSTEM_3)

            npc:setLocalVar("PillarCharged", 0) -- Pillar always loses charge after a morph attempt.
        else
            player:PrintToPlayer(string.format("The pillar must be charged with energy from the Brigandish Blade."),tpz.msg.channel.SYSTEM_3)
            -- player:messageSpecial(ID.text.NOTHING_HAPPENS)
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(2)

    if npc:getLocalVar("PillarCharged") == 1 then
        player:PrintToPlayer(string.format("The pillar crackles with energy from the Brigandish Blade."),tpz.msg.channel.SYSTEM_3)
    elseif npc:getLocalVar("PillarCharged") == 0 then
        player:PrintToPlayer(string.format("The pillar must be charged with energy from the Brigandish Blade."),tpz.msg.channel.SYSTEM_3)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end