---------------------------------------------------------------------------------------------------
-- func: !testmagic
-- desc: Toggles the TestMagicSystem local var on/off and switches between the old/new enfeebling resistance system
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if (player:getLocalVar("TestMagicSystem") == 0) then
		player:setLocalVar("TestMagicSystem", 1)
		player:PrintToPlayer(string.format("Old Resistance System Active"))
	else
		player:setLocalVar("TestMagicSystem", 0)
		player:PrintToPlayer(string.format("New Resistance System Active"))
	end
end