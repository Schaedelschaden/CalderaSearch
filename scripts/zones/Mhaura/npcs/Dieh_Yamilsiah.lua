-----------------------------------
-- Area: Mhaura
--  NPC: Dieh Yamilsiah
-- Reports the time remaining before boat arrival.
-- !pos 7.057 -2.364 2.489 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/transport")
-----------------------------------
local path =
{
    ARRIVING  = {{7.06, -1.36, 2.48}, {7.07, -1.36, 2.58}},
    DEPARTING = {{8.26, -1.36, 2.20}, {8.26, -1.36, 2.30}},
}

local messages =
{
    [tpz.transport.trigger.mhaura.FERRY_ARRIVING_FROM_ALZAHBI] = ID.text.FERRY_ARRIVING,
    [tpz.transport.trigger.mhaura.FERRY_DEPARTING_TO_ALZAHBI]  = ID.text.FERRY_DEPARTING,
    [tpz.transport.trigger.mhaura.FERRY_ARRIVING_FROM_SELBINA] = ID.text.FERRY_ARRIVING,
    [tpz.transport.trigger.mhaura.FERRY_DEPARTING_TO_SELBINA]  = ID.text.FERRY_DEPARTING
}

function onSpawn(npc)
    npc:initNpcPathing()
    npc:setPos(8.260, -1.360, 2.299, 191)
    onPath(npc)

    npc:addPeriodicTrigger(tpz.transport.trigger.mhaura.FERRY_ARRIVING_FROM_ALZAHBI,
        tpz.transport.interval.mhaura.FROM_TO_ALZAHBI,
        tpz.transport.offset.mhaura.FERRY_ARRIVING_FROM_ALZAHBI)
    npc:addPeriodicTrigger(tpz.transport.trigger.mhaura.FERRY_DEPARTING_TO_ALZAHBI,
        tpz.transport.interval.mhaura.FROM_TO_ALZAHBI,
        tpz.transport.offset.mhaura.FERRY_DEPARTING_TO_ALZAHBI)
    npc:addPeriodicTrigger(tpz.transport.trigger.mhaura.FERRY_ARRIVING_FROM_SELBINA,
        tpz.transport.interval.mhaura.FROM_TO_SELBINA,
        tpz.transport.offset.mhaura.FERRY_ARRIVING_FROM_SELBINA)
    npc:addPeriodicTrigger(tpz.transport.trigger.mhaura.FERRY_DEPARTING_TO_SELBINA,
        tpz.transport.interval.mhaura.FROM_TO_SELBINA,
        tpz.transport.offset.mhaura.FERRY_DEPARTING_TO_SELBINA)
end

function onPath(npc)
    local pos = npc:getPos()
    local point = npc:getPathPoint()

    if npc:getLocalVar("[PATHING]DEPARTING") == 1 then
        local departPath = path.DEPARTING
        tpz.path.toPoint(npc, departPath, false)
        if point == #departPath then
            npc:rotateToAngle(191)
            npc:setLocalVar("[PATHING]DEPARTING", 0)
        end
    elseif npc:getLocalVar("[PATHING]ARRIVING") == 1 then
        local arrivePath = path.ARRIVING
        tpz.path.toPoint(npc, arrivePath, false)
        if point == #arrivePath then
            npc:rotateToAngle(211)
            npc:setLocalVar("[PATHING]ARRIVING", 0)
        end
    end
end

function onTimeTrigger(npc, triggerID)
    tpz.transport.dockMessage(npc, triggerID, messages, 'mhaura')
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    -- Each boat comes every 1152 seconds/8 game hours, 4 hour offset between Selbina and Aht Urghan
    -- Original timer: local timer = 1152 - ((os.time() - 1009810584)%1152);
    local timer = 1152 - ((os.time() - 1009810802)%1152)
    local destination = 0 -- Selbina, set to 1 for Al Zhabi
    local direction = 0 -- Arrive, 1 for depart
    local waiting = 216 -- Offset for Selbina

    -- Next ferry is Al Zhabi for higher values.
    if (timer >= 576) then
        destination = 1
        timer = timer - 576
        waiting = 193
    end

    -- Logic to manipulate cutscene results.
    if (timer <= waiting) then
        direction = 1 -- Ship arrived, switch dialog from "arrive" to "depart"
    else
        timer = timer - waiting -- Ship hasn't arrived, subtract waiting time to get time to arrival
    end

    player:startEvent(231,timer,direction,0,destination) -- timer arriving/departing ??? destination

    --[[Other cutscenes:
    233 "This ship is headed for Selbina."
    234 "The Selbina ferry will deparrrt soon!  Passengers are to board the ship immediately!"

    Can't find a way to toggle the destination on 233 or 234, so they are not used.
    Users knowing which ferry is which > using all CSs.]]

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end