---------------------------------------------------------------------------------------------------
-- func: !setspawnpos
-- desc: Sets the monster's spawn position to the triggering player's current position
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sssss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setspawnpos")
end

function onTrigger(player)
    local target = player:getCursorTarget()
    local pos = player:getPos()

    -- validate target
    if (target == nil or not target:isMob()) then
        player:PrintToPlayer("You must target a monster with this command.")
		return
    end
	
	target:setSpawn(pos.x, pos.y, pos.z, 0)
	target:setPos(pos.x, pos.y, pos.z)
	player:PrintToPlayer(string.format("Set %s's (ID: %i) spawn point to X: %3.3f Y: %3.3f Z: %3.3f.", target:getName(), target:getID(), pos.x, pos.y, pos.z),tpz.msg.channel.SYSTEM_3)
end