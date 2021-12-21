-----------------------------------
-- Area: Qufim Island (126)
--  NPC: Undulating Confluence
-- !pos -204.531 -20.027 75.318 126
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	if (player:getMainLvl() < 90) then
		player:PrintToPlayer(string.format("You must be level 90 or higher to enter Escha - Zi'Tah!"),tpz.msg.channel.SYSTEM_3)
	else	
--		if (player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailofLove") > 0) then
		if (player:getCharVar("KillCounter_AAHM") > 0 and player:getCharVar("KillCounter_AATT") > 0 and player:getCharVar("KillCounter_AAMT") > 0 and
			player:getCharVar("KillCounter_AAEV") > 0 and player:getCharVar("KillCounter_AAGK") > 0) then
			-- if player:getCurrentMission(ROV) == tpz.mission.id.rov.AT_THE_HEAVENS_DOOR then
				-- player:startEvent(63)
			-- elseif player:getCurrentMission(ROV) == tpz.mission.id.rov.THE_LIONS_ROAR then
				-- npcUtil.popFromQM(player, npc, ID.mob.OPHIOTAURUS, { look=true, hide=0 })
			-- elseif player:getCurrentMission(ROV) == tpz.mission.id.rov.EDDIES_OF_DESPAIR_I then
				-- player:startEvent(64)
			-- elseif player:getCurrentMission(ROV) >= tpz.mission.id.rov.SET_FREE then
				-- player:startEvent(65)
			-- end
			player:setPos(-338, 6, -225, 172, 288)
		else
			player:PrintToPlayer(string.format("You sense that the power of the Ark Angels is preventing you from entering the confluence!"),tpz.msg.channel.SYSTEM_3)
		-- elseif (player:getCharVar("KillCounter_Kirin") == 0 and player:getCharVar("KillCounter_JailofLove") == 0) then
			-- player:PrintToPlayer(string.format("You sense that the power of Kirin and the Jailer of Love is preventing you from entering the confluence!"),tpz.msg.channel.SYSTEM_3)
		-- elseif (player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailofLove") == 0) then
			-- player:PrintToPlayer(string.format("You sense that the power of the Jailer of Love is preventing you from entering the confluence!"),tpz.msg.channel.SYSTEM_3)
		-- elseif (player:getCharVar("KillCounter_Kirin") == 0 and player:getCharVar("KillCounter_JailofLove") > 0) then
			-- player:PrintToPlayer(string.format("You sense that the power of Kirin is preventing you from entering the confluence!"),tpz.msg.channel.SYSTEM_3)
		end
	end
	-- player:PrintToPlayer(string.format("Escha - Zi'Tah is currently being rebalanced and is not available."),tpz.msg.channel.SYSTEM_3)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 63 then
        player:completeMission(ROV, tpz.mission.id.rov.AT_THE_HEAVENS_DOOR)
        player:addMission(ROV, tpz.mission.id.rov.THE_LIONS_ROAR)
    elseif csid == 64 then
        player:setPos(-338, 6, -225, 172, 288)
    elseif csid == 65 and option == 1 then
        player:setPos(-338, 6, -225, 172, 288)
    end
end