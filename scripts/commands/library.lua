---------------------------------------------------------------------------------------------------
-- func: !library
-- desc: Teleports the player to the Celennia Memorial Library.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-105, -2, -95, 224, 284)
end