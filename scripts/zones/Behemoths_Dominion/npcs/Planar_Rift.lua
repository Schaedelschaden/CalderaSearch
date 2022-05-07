-----------------------------------
-- Area: Behemoth's Dominion (127)
--  NPC: Planar Rift
-- ID1: 17297501  !pos -210 -20.3 70 127
-- ID2: 17297502  !pos -4 -4.3 -33.3 127
-- ID3: 17297503  !pos 144.7 4.3 -123 127
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
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
		-- printf("Planar_Rift.lua onTrigger BEHEMOTH'S DOMINION  MEMBER: [%s]  CHERUFE KC: [%i]  TAWERET KC: [%i]  YATAGARASU KC: [%i]  AGATHOS KC: [%i]  GOJI KC: [%i]  GUGALANNA KC: [%i]", v:getName(), member[i]:getCharVar("KillCounter_Cherufe"), member[i]:getCharVar("KillCounter_Taweret"), member[i]:getCharVar("KillCounter_Yatagarasu"), member[i]:getCharVar("KillCounter_Agathos"), member[i]:getCharVar("KillCounter_Goji"), member[i]:getCharVar("KillCounter_Gugalanna"))
		
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
		if (npc:getID() == 17297501) then
			player:setLocalVar("VOIDWATCH_LOCATION", 1)
		elseif (npc:getID() == 17297502) then
			player:setLocalVar("VOIDWATCH_LOCATION", 2)
		elseif (npc:getID() == 17297503) then
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
		if (player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17297452):isSpawned()) then
			SpawnMob(17297452):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17297453):isSpawned()) then
			SpawnMob(17297453):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17297454):isSpawned()) then
			SpawnMob(17297454):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		end
	end
end