---------------------------------------------------------------------------------------------------
-- func: !yhoat
-- desc: Teleports the player to the Crag of Yhoat
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    -- Teleport target
--	if (player:getHP() == player:getMaxHP() and player:hasKeyItem(tpz.ki.YHOATOR_GATE_CRYSTAL)) then
	if (player:hasKeyItem(tpz.ki.YHOATOR_GATE_CRYSTAL)) then
		player:setPos(-281, 1, -144, 0, 124)
	else
--		player:PrintToPlayer(string.format("You must have the Yhoator Gate Crystal and be at full HP to use that command!"),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("You must have the Yhoator Gate Crystal!"),tpz.msg.channel.SYSTEM_3)
	end
end