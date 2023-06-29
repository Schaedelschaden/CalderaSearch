---------------------------------------------------------------------------------------------------
-- func: !setsize {size}
-- desc: Sets player's size to the value provided.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 0,
    parameters = "i"
}

function onTrigger(player, size)
    local sizes =
    {
        [0] = "small",
        [1] = "medium",
        [2] = "large",
    }
    local zoneID = player:getZoneID()

    if zoneID ~= 284 then -- Celennia Memorial Library
        player:PrintToPlayer(string.format("You must be in the library to use this command."),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    if size == nil or (size < 0 or size > 2) then
        player:PrintToPlayer(string.format("!setrace {size}"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("You must specify one of the following size options"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Small: 0  Medium: 1  Large: 2"),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    player:setSize(size)
    player:PrintToPlayer(string.format("Set %s's size to %s (ID: %i).", player:getName(), sizes[size], size),tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Zoning in 3 seconds to apply change."),tpz.msg.channel.NS_LINKSHELL3)

    player:timer(3000, function(playerArg)
        playerArg:setPos(playerArg:getXPos(), playerArg:getYPos(), playerArg:getZPos(), playerArg:getRotPos(), playerArg:getZoneID())
    end)
end
