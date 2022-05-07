-----------------------------------
-- Area: Lower Delkfutt's Tower (184)
--  NPC: Planar Rift
-- ID1: 17531226  !pos 421 16.4 -20 184
-- ID2: 17531227  !pos 388 -16 121 184
-- ID3: 17531228  !pos 505 -32 95 184
-----------------------------------
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs")
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
		-- printf("Planar_Rift.lua onTrigger LOWER DELKFUTT'S TOWER  MEMBER: [%s]  CHERUFE KC: [%i]  TAWERET KC: [%i]  YATAGARASU KC: [%i]  AGATHOS KC: [%i]  GOJI KC: [%i]  GUGALANNA KC: [%i]", v:getName(), member[i]:getCharVar("KillCounter_Cherufe"), member[i]:getCharVar("KillCounter_Taweret"), member[i]:getCharVar("KillCounter_Yatagarasu"), member[i]:getCharVar("KillCounter_Agathos"), member[i]:getCharVar("KillCounter_Goji"), member[i]:getCharVar("KillCounter_Gugalanna"))
		
		if (member[i]:getCharVar("KillCounter_Cherufe") < 1 or member[i]:getCharVar("KillCounter_Taweret") < 1 or member[i]:getCharVar("KillCounter_Yatagarasu") < 1 or 
			member[i]:getCharVar("KillCounter_Agathos") < 1 or member[i]:getCharVar("KillCounter_Goji") < 1 or member[i]:getCharVar("KillCounter_Gugalanna") < 1) then
			spawnDenied = true
			troubleMember = member[i]
			break
		end
	end
	
	if (spawnDenied == true) then
		npc:PrintToArea(string.format("Spawn prevented because [%s] does not have the T2 Voidwatch clears.", troubleMember:getName()),tpz.msg.channel.SYSTEM_1, tpz.msg.area.SHOUT)
		return
	end

	if (player:hasKeyItem(tpz.ki.VOIDSTONE1)) then
		player:startEvent(6001, 14, 16, 0, 0, 0, 0, 49255, abyssite)
		if (npc:getID() == 17531226) then
			player:setLocalVar("VOIDWATCH_LOCATION", 1)
		elseif (npc:getID() == 17531227) then
			player:setLocalVar("VOIDWATCH_LOCATION", 2)
		elseif (npc:getID() == 17531228) then
			player:setLocalVar("VOIDWATCH_LOCATION", 3)
		end
	else
		player:PrintToPlayer(string.format("You must have a Voidstone to participate in a Voidwatch operation."),tpz.msg.channel.SYSTEM_3)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	-- Spawn Kaggen (Sinister Reign Voidwatch)
	if (option == 1) then
		if (player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17531126):isSpawned()) then
			SpawnMob(17531126):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17531127):isSpawned()) then
			SpawnMob(17531127):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17531128):isSpawned()) then
			SpawnMob(17531128):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		end
	end
end