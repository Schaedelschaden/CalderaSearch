-----------------------------------
-- Area: Batallia Downs (105)
--  NPC: Planar Rift
-- !pos 80 8 -280
-- !pos 276 8.3 -390
-- !pos -320 -16 -42
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs/IDs")
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
		if (npc:getID() == 17207929) then
			player:setLocalVar("VOIDWATCH_LOCATION", 1)
		elseif (npc:getID() == 17207930) then
			player:setLocalVar("VOIDWATCH_LOCATION", 2)
		elseif (npc:getID() == 17207931) then
			player:setLocalVar("VOIDWATCH_LOCATION", 3)
		end
	else
		player:PrintToPlayer(string.format("You must have a Voidstone to participate in a Voidwatch operation."),tpz.msg.channel.SYSTEM_3)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	-- Spawn Cherufe (Jeuno T1 Voidwatch)
	if (option == 1) then
		if (player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17207723):isSpawned()) then
			SpawnMob(17207723):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17207724):isSpawned()) then
			SpawnMob(17207724):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17207725):isSpawned()) then
			SpawnMob(17207725):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		end
	end
end