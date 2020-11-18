---------------------------------------------------------------------------------------------------
-- func: !jofort4
-- desc: desc: Teleports the player to the Jailer of Fortitude's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-579, 0, 55, 65, 35)
end