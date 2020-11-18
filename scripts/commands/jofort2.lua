---------------------------------------------------------------------------------------------------
-- func: !jofort2
-- desc: desc: Teleports the player to the Jailer of Fortitude's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-56, 0, 460, 0, 35)
end