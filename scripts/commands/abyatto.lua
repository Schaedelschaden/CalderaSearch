---------------------------------------------------------------------------------------------------
-- func: !abyatto
-- desc: Teleports ace to aby attowha
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if (player:getName() == "VengeanceAce" or player:getName() == "Acewrap" or player:getName() == "Acebandage") then
        player:setPos(-139.0000, 20.2806, -180.0000, 131, 215)
    end
end