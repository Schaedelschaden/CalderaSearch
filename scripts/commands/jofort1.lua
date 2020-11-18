---------------------------------------------------------------------------------------------------
-- func: !jofort1
-- desc: desc: Teleports the player to the Jailer of Fortitude's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-420, 0, 743, 194, 35)
end