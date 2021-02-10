---------------------------------------------------------------------------------------------------
-- func: !surprise <level>
-- desc: Spawns an NM at an increased level for a special event.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

-- local NM = {
	-- {zone = 100, name = "West Ronfaure", mobID = 17187047},
	-- {zone = 101, name = "East Ronfaure", mobID = 17191189}
-- }

function onTrigger(player, level)
	-- local zoneName = player:getZoneName()
	-- local fixedZoneName = string.gsub(zoneName, "_", " ")
--	printf("surprise.cpp onTrigger ZONE: [%s]\n", fixedZoneName)
	-- local spawningZone = player:getZoneID()
	-- local playerName = player:getName()
	-- local channel = 6
	-- local message
	-- local targ
	
--	SetServerVariable("SurpriseSpecialEvent", 1)
	
--	for i, v in pairs(NM) do
--		if (spawningZone == NM[i].zone) then
--			message = string.format("An ominous presence is lurking in %s!", fixedZoneName)
			
--			SpawnMob(NM[i].mobID)
			
--			targ = GetMobByID(NM[i].mobID)
--		end
--	end
	
--	targ:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
--	targ:setMobFlags(5, targ:getID())
--	targ:addStatusEffect(11, 1, 3, 0)
--	targ:setMobLevel(level)
--	targ:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
	
--	SendServerMsg(playerName, channel, message)
end