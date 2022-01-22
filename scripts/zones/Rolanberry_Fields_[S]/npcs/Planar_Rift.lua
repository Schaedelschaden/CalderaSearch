-----------------------------------
-- Area: Rolanberry Fields (S) (91)
--  NPC: Planar Rift
-- !pos -360 8 279
-- !pos -435 -7.9 15
-- !pos -630 -23.7 -270
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local abyssite = 1444 -- White Stratum Abyssite

	local allianceList = player:getAlliance()
	local member = {}
	local spawnDenied = false
	local troubleMember
	
	for i,v in ipairs(allianceList) do
		member[i] = GetPlayerByName(v:getName())
		-- printf("Planar_Rift.lua onTrigger BATALLIA DOWNS  MEMBER: [%s]  HAHAVA KC: [%i]  VOIDWROUGHT KC: [%i]  CELAENO KC: [%i]", v:getName(), member[i]:getCharVar("KillCounter_Hahava"), member[i]:getCharVar("KillCounter_Voidwrought"), member[i]:getCharVar("KillCounter_Celaeno"))
		
		if (member[i]:getCharVar("KillCounter_Hahava") < 1 or member[i]:getCharVar("KillCounter_Voidwrought") < 1 or member[i]:getCharVar("KillCounter_Celaeno") < 1) then
			spawnDenied = true
			troubleMember = member[i]
			break
		end
	end
	
	if (spawnDenied == true) then
		npc:PrintToArea(string.format("Spawn prevented because [%s] does not have the City Voidwatch clears.", troubleMember:getName()),tpz.msg.channel.SYSTEM_1, tpz.msg.area.SHOUT)
		return
	end

	if (player:hasKeyItem(tpz.ki.VOIDSTONE1)) then
		player:startEvent(6001, 14, 16, 0, 0, 0, 0, 49255, abyssite)
		if (npc:getID() == 17150836) then
			player:setLocalVar("VOIDWATCH_LOCATION", 1)
		elseif (npc:getID() == 17150837) then
			player:setLocalVar("VOIDWATCH_LOCATION", 2)
		elseif (npc:getID() == 17150838) then
			player:setLocalVar("VOIDWATCH_LOCATION", 3)
		end
	else
		player:PrintToPlayer(string.format("You must have a Voidstone to participate in a Voidwatch operation."),tpz.msg.channel.SYSTEM_3)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	-- Spawn Agathos (Jeuno T1 Voidwatch)
	if (option == 1) then
		if (player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17150669):isSpawned()) then
			SpawnMob(17150669):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17150670):isSpawned()) then
			SpawnMob(17150670):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17150671):isSpawned()) then
			SpawnMob(17150671):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		end
	end
end