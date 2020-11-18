---------------------------------------------------------------------------------------------------
-- func: !ixdrk3
-- desc: Teleports the player to the Ix'DRK's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-506, 4, -506, 98, 35)
end