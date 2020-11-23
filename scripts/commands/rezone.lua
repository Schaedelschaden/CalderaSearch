---------------------------------------------------------------------------------------------------
-- func: !rezone
-- desc: Zones the player and returns them to the exact same spot
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!rezone")
end

function onTrigger(player)
    player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
end