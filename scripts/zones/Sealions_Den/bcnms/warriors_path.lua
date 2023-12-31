-----------------------------------
-- Area: Sealion's Den
-- Name: The Warrior's Path
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(tpz.ki.WARRIORS_PATH_PHANTOM_GEM)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getCurrentMission(COP) ~= tpz.mission.id.cop.THE_WARRIOR_S_PATH) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(COP) == tpz.mission.id.cop.THE_WARRIOR_S_PATH then
            player:completeMission(COP, tpz.mission.id.cop.THE_WARRIOR_S_PATH)
            player:addMission(COP, tpz.mission.id.cop.GARDEN_OF_ANTIQUITY)
            player:setCharVar("PromathiaStatus", 0)
        end
        -- player:addExp(1000)
        player:addTitle(tpz.title.UNWAVERING_BLAZE)
        -- player:setPos(-25, -1, -620, 208, 33) -- Al'Taieu
    end
end
