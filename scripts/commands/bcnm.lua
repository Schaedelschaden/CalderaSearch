---------------------------------------------------------------------------------------------------
-- func: !bcnm
-- desc: Teleports the player to the BCNM vendor area in The Colosseum.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(47, -6, -272, 62, 71)
end