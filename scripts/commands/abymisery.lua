---------------------------------------------------------------------------------------------------
-- func: !abymisery
-- desc: Teleports ace to aby misery
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if (player:getName() == "VengeanceAce" or player:getName() == "Acewrap" or player:getName() == "Acebandage") then
        player:setPos(670.0000, -15.7082, 318.0000, 119, 216)
    end
end