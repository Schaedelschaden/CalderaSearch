---------------------------------------------------------------------------------------------------
-- func: !maintenance
-- desc: Sends timed messages from the triggering player until server shutdown.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local playerName = player:getName()
    local channel    = 6
    local message    = string.format("Server restart scheduled. Time to restart: 15 minutes.")

    SendServerMsg(playerName, channel, message)

    player:timer(300000, function(player) -- 10 minutes remaining
        message = string.format("Time to server restart: 10 minutes")
        SendServerMsg(playerName, channel, message)

        player:timer(300000, function(player) -- 5 minutes remaining
            message = string.format("Time to server restart: 5 minutes")
            SendServerMsg(playerName, channel, message)

            player:timer(120000, function(player) -- 3 minutes remaining
                message = string.format("Time to server restart: 3 minutes")
                SendServerMsg(playerName, channel, message)

                player:timer(120000, function(player) -- 1 minute remaining
                    message = string.format("Time to server restart: 1 minute")
                    SendServerMsg(playerName, channel, message)

                    player:timer(30000, function(player) -- 30 seconds remaining
                        message = string.format("Time to server restart: 30 seconds")
                        SendServerMsg(playerName, channel, message)

                        player:timer(30000, function(player) -- Complete
                            message = string.format("Server restarting.")
                            SendServerMsg(playerName, channel, message)
                        end)
                    end)
                end)
            end)
        end)
    end)
end
