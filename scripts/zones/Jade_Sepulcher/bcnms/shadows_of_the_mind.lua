-----------------------------------
-- Area: Jade Sepulcher
-- ISNM: Shadows of the Mind
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = 0 and 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
