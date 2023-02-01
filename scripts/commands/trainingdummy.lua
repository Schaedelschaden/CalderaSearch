---------------------------------------------------------------------------------------------------
-- func: Teleports the player to the test dummy outside the West Ronfaure/Southern San d'Oria gate
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-161.835, -60, 277.623, 250, 100) -- West Ronfaure Test Dummy
end
