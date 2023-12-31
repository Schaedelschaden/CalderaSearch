-----------------------------------
-- Area: Jade Sepulcher
-- BCNM: TOAU-29 Puppet in Peril
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
	player:delKeyItem(tpz.ki.PUPPET_IN_PERIL_PHANTOM_GEM)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = true and 1 --(player:hasCompletedMission(TOAU, tpz.mission.id.toau.PUPPET_IN_PERIL)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002) --So I think we need to force the mission value to 1 to skip CS. Trying to find a work around for the CS, but if you disable it.....maybe hard code a warp out
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:getCurrentMission(TOAU) == tpz.mission.id.toau.PUPPET_IN_PERIL then
        player:completeMission(TOAU, tpz.mission.id.toau.PUPPET_IN_PERIL)
        player:addMission(TOAU, tpz.mission.id.toau.PREVALENCE_OF_PIRATES)
        player:setCharVar("AhtUrganStatus", 0)
    end
end
