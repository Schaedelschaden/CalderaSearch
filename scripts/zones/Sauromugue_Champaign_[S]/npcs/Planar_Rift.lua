-----------------------------------
-- Area: Sauromugue Champaign (S) (98)
--  NPC: Planar Rift
-- !pos -245 7.7 245
-- !pos 80 32 323
-- !pos 500 8.2 -290
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs")
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
		if (npc:getID() == 17179516) then
			player:setLocalVar("VOIDWATCH_LOCATION", 1)
		elseif (npc:getID() == 17179517) then
			player:setLocalVar("VOIDWATCH_LOCATION", 2)
		elseif (npc:getID() == 17179518) then
			player:setLocalVar("VOIDWATCH_LOCATION", 3)
		end
	else
		player:PrintToPlayer(string.format("You must have a Voidstone to participate in a Voidwatch operation."),tpz.msg.channel.SYSTEM_3)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	-- Spawn Gugalanna (Jeuno T1 Voidwatch)
	if (option == 1) then
		if (player:getLocalVar("VOIDWATCH_LOCATION") == 1 and not GetMobByID(17179263):isSpawned()) then
			SpawnMob(17179263):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 2 and not GetMobByID(17179264):isSpawned()) then
			SpawnMob(17179264):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		elseif (player:getLocalVar("VOIDWATCH_LOCATION") == 3 and not GetMobByID(17179265):isSpawned()) then
			SpawnMob(17179265):updateClaim(player)
			player:delKeyItem(tpz.ki.VOIDSTONE1)
		end
	end
end