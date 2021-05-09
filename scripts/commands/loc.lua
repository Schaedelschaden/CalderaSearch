---------------------------------------------------------------------------------------------------
-- func: !loc
-- desc: Prints out the player's position.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	local pos = player:getPos()
	player:PrintToPlayer(string.format("X: %.4f  Y: %.4f  Z: %.4f  Rotation: %i  Zone: %i", pos.x, pos.y, pos.z, pos.rot,player:getZoneID()),tpz.msg.channel.SYSTEM_3)
end