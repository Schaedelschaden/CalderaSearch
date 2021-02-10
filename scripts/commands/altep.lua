---------------------------------------------------------------------------------------------------
-- func: !altep
-- desc: Teleports the player to the Crag of Altep
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    -- Teleport target
	if (player:getHP() == player:getMaxHP() and player:hasKeyItem(tpz.ki.ALTEPA_GATE_CRYSTAL)) then
		player:setPos(-62, 4, 225, 0, 114)
	else
		player:PrintToPlayer(string.format("You must have the Altepa Gate Crystal and be at full HP to use that command!"),tpz.msg.channel.SYSTEM_3)
	end
end