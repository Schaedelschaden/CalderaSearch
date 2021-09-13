-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vhana Ehgaklywha
-- Lights lamps in Lower Jeuno if nobody accepts Community Service by 1AM.
-- !pos -122.853 0.000 -195.605 245
-----------------------------------
require("scripts/zones/Lower_Jeuno/globals")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/pathfind")
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:showText(npc, ID.text.VHANA_TEXT)
    npc:clearTargID()
end

function onPath(npc)
    local point = npc:getPathPoint()

    if npc:getStatus() == tpz.status.NORMAL then
        -- make vasha disappear if for some reason she is is spawned before 1am and after 5am
        -- also make her disappear when she finishes the path.
        if VanadielHour() < 1 or VanadielHour() >= 5 or point == #LOWER_JEUNO.lampPath then
            npc:clearPath()
            npc:setStatus(tpz.status.DISAPPEAR)
            npc:speed(0) -- -- npc:pathStop()
        else
            -- if vasha is at one of the lamp points, turn on that lamp.
            -- she reaches the lamps in reverse order of their npcIds, hence (12 - i).
            for i = 1, #LOWER_JEUNO.lampPoints do
                if LOWER_JEUNO.lampPoints[i] == point then
                    local lamp = GetNPCByID(ID.npc.STREETLAMP_OFFSET + (12 -i))
                    lamp:setAnimation(tpz.anim.OPEN_DOOR)
                    break
                end
            end
        end
        tpz.path.general(npc, LOWER_JEUNO.lampPath, tpz.path.flag.NONE, false)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    npc:speed(40) -- npc:pathResume() 
end