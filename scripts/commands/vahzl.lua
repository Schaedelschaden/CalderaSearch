---------------------------------------------------------------------------------------------------
-- func: !vahzl
-- desc: Teleports the player to the Crag of Vahzl
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    -- Teleport target
--	if (player:getHP() == player:getMaxHP() and player:hasKeyItem(tpz.ki.VAHZL_GATE_CRYSTAL)) then
	if (player:hasKeyItem(tpz.ki.VAHZL_GATE_CRYSTAL)) then
		player:setPos(150, -21, -37, 94, 112)
	else
--		player:PrintToPlayer(string.format("You must have the Vahzl Gate Crystal and be at full HP to use that command!"),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("You must have the Vahzl Gate Crystal!"),tpz.msg.channel.SYSTEM_3)
	end
end