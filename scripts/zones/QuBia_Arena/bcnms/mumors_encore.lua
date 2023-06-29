-----------------------------------
-- mumors encore
-----------------------------------
require("scripts/globals/battlefield")
-----------------------------------

function onBattlefieldInitialise(battlefield)
end

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    local keyid = tpz.ki.AFTERPARTY_PASS
    player:delKeyItem(tpz.ki.AFTERPARTY_PASS)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        player:delStatusEffect(tpz.effect.HASTE_SAMBA)
        player:delStatusEffect(tpz.effect.DRAIN_SAMBA)
        player:delStatusEffect(tpz.effect.ASPIR_SAMBA)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
        player:delStatusEffect(tpz.effect.HASTE_SAMBA)
        player:delStatusEffect(tpz.effect.DRAIN_SAMBA)
        player:delStatusEffect(tpz.effect.ASPIR_SAMBA)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

