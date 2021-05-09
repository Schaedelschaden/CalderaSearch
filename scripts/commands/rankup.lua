---------------------------------------------------------------------------------------------------
-- func: setrank
-- desc: Sets the players rank.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	local nation = player:getNation()
	local logID = 0

	if (nation == tpz.nation.BASTOK) then
		logID = 1
	elseif (nation == tpz.nation.WINDURST) then
		logID = 2
	end
	
	for i = 0, 23 do
		player:completeMission(logID, i)
		if (i < 23) then
			player:addMission(logID, i + 1)
		end
	end
	
	player:addKeyItem(8) -- Airship Pass
	player:addKeyItem(9) -- Airship Pass for Kazham
	player:addKeyItem(35) -- Adventurer's Certificate
	player:addKeyItem(36) -- Starway Satirway Bauble
	player:addKeyItem(195) -- Portal Charm
	player:setRank(10)
	
	-- Fix Rise of the Zilart Missions
	-- local missionZM = {0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 23, 24, 26, 27, 28, 30}
	-- for i = 
end