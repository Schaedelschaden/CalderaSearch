---------------------------------------------------------------------------------------------------
-- func: !jofort3
-- desc: desc: Teleports the player to the Jailer of Fortitude's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-260, 0, 56, 65, 35)
end