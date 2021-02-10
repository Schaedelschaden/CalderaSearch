---------------------------------------------------------------------------------------------------
-- func: !holla
-- desc: Teleports the player to the Crag of Holla
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    -- Teleport target
	if (player:getHP() == player:getMaxHP()) then
		player:setPos(420, 19, 20, 0, 102)
	else
		player:PrintToPlayer(string.format("You must be at full HP to use that command!"),tpz.msg.channel.SYSTEM_3)
	end
end