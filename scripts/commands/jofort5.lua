---------------------------------------------------------------------------------------------------
-- func: !jofort5
-- desc: desc: Teleports the player to the Jailer of Fortitude's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-783, 0, 460, 126, 35)
end