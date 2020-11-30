---------------------------------------------------------------------------------------------------
-- func: !rezone
-- desc: Zones the player and returns them to the exact same spot
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("You must have full HP to use this command!")
end

function onTrigger(player)
	if (player:getHP() < player:getMaxHP()) then
		player:PrintToPlayer(string.format("You must have full HP to use this command!", player))
		return
	end
	
    player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
end