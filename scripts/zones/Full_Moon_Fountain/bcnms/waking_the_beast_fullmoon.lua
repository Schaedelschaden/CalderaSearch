-----------------------------------
-- Area: Full Moon Fountain
-- Name: Waking the Beast
-----------------------------------
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
	player:delKeyItem(tpz.ki.WAKING_THE_BEAST_PHANTOM_GEM)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getQuestStatus(WINDURST, tpz.quest.id.otherAreas.WAKING_THE_BEAST) == QUEST_COMPLETED) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if (player:hasPet() == true) then
			player:despawnPet()
			player:resetRecast(104) -- Call Beast
			player:resetRecast(163) -- Call Wyvern
			player:resetRecast(205) -- Activate
			player:PrintToPlayer(string.format("WARNING: WAIT TO RESUMMON YOUR PET UNTIL YOU ARE OUTSIDE OF THE BATTLEFIELD ZONE."), tpz.msg.channel.SYSTEM_1)
		end
    end
end