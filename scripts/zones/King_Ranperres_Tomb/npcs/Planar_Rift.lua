-----------------------------------
-- Area: King Ranperre's Tomb (190)
--  NPC: Planar Rift
-- !pos -115 9 60
-- !pos -121 7.5 -361
-- !pos -59 8 154
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
    local abyssite = 373 -- Indigo Stratum Abyssite IV

    if player:hasKeyItem(tpz.ki.VOIDSTONE1) then
        player:startEvent(6001, 14, 16, 0, 0, 0, 0, 49255, abyssite)
        if npc:getID() == 17556020 then -- ID.npc.PLANAR_RIFT
            player:setLocalVar("VOIDWATCH_LOCATION", 1)
        elseif npc:getID() == 17556021 then -- ID.npc.PLANAR_RIFT + 1
            player:setLocalVar("VOIDWATCH_LOCATION", 2)
        elseif npc:getID() == 17556022 then -- ID.npc.PLANAR_RIFT + 2
            player:setLocalVar("VOIDWATCH_LOCATION", 3)
        end
    else
        player:PrintToPlayer(string.format("You must have a Voidstone to participate in a Voidwatch operation."),tpz.msg.channel.SYSTEM_3)
    end
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)
    if option == 1 then
        if player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17555773):isSpawned() then -- ID.mob.HAHAVA
            SpawnMob(17555773):updateClaim(player) -- ID.mob.HAHAVA
            player:delKeyItem(tpz.ki.VOIDSTONE1)
        elseif player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17555774):isSpawned() then -- ID.mob.HAHAVA + 1
            SpawnMob(17555774):updateClaim(player) -- ID.mob.HAHAVA + 1
            player:delKeyItem(tpz.ki.VOIDSTONE1)
        elseif player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17555775):isSpawned() then -- ID.mob.HAHAVA + 2
            SpawnMob(17555775):updateClaim(player) -- ID.mob.HAHAVA + 2
            player:delKeyItem(tpz.ki.VOIDSTONE1)
        end
    end
end
