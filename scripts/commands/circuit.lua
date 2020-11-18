---------------------------------------------------------------------------------------------------
-- func: !circuit
-- desc: Teleports the player to the Chocobo Circuit starting line.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-65, 0, -80, 1, 70)
end