---------------------------------------------------------------------------------------------------
-- func: !setrace {raceID}
-- desc: Sets player's race to the ID provided.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 0,
    parameters = "i"
}

function onTrigger(player, raceID)
    local races =
    {
        [1] = "Hume Male",
        [2] = "Hume Female",
        [3] = "Elvaan Male",
        [4] = "Elvaan Female",
        [5] = "Tarutaru Male",
        [6] = "Tarutaru Female",
        [7] = "Mithra",
        [8] = "Galka",
    }
    local zoneID = player:getZoneID()

    if player:getGMLevel() < 1 and player:getCharVar("Last_Race_Change") > os.time() then
        local timeLeft = player:getCharVar("Last_Race_Change") - os.time()
        local days     = math.floor(timeLeft / 86400)
        local hours    = math.floor((timeLeft - (days * 86400)) / 3600)
        local minutes  = math.floor((timeLeft - (days * 86400) - (hours * 3600)) / 60)
        local seconds  = math.floor(timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60))

        player:PrintToPlayer(string.format("You must wait %i days %i hours %i minutes and %i seconds to use that command.", days, hours, minutes, seconds),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    if zoneID ~= 284 then -- Celennia Memorial Library
        player:PrintToPlayer(string.format("You must be in the library to use this command."),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    if raceID == nil or (raceID < 1 or raceID > 8) then
        player:PrintToPlayer(string.format("!setrace {raceID}"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("You must specify one of the following racial IDs"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Hume M: 1  Hume F: 2  Elvaan M: 3  Elvaan F: 4"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Taru M: 5  Taru F: 6  Mithra: 7    Galka: 8"),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    player:setRace(raceID)
    player:setCharVar("Last_Race_Change", os.time() + 604800) -- 7 days after using the command
    player:PrintToPlayer(string.format("Set %s's race to %s (ID: %i).", player:getName(), races[raceID], raceID),tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Zoning in 3 seconds to apply change."),tpz.msg.channel.NS_LINKSHELL3)

    player:timer(3000, function(playerArg)
        playerArg:setPos(playerArg:getXPos(), playerArg:getYPos(), playerArg:getZPos(), playerArg:getRotPos(), playerArg:getZoneID())
    end)
end
