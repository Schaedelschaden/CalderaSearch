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

    player:timer(300000, function(playerArg1) -- 10 minutes remaining
        local playerName = playerArg1:getName()
        local channel    = 6
        local message    = string.format("Time to server restart: 10 minutes")

        SendServerMsg(playerName, channel, message)

        playerArg1:timer(300000, function(playerArg2) -- 5 minutes remaining
            local playerName = playerArg2:getName()
            local channel    = 6
            local message = string.format("Time to server restart: 5 minutes")

            SendServerMsg(playerName, channel, message)

            playerArg2:timer(120000, function(playerArg3) -- 3 minutes remaining
                local playerName = playerArg3:getName()
                local channel    = 6
                local message    = string.format("Time to server restart: 3 minutes")

                SendServerMsg(playerName, channel, message)

                playerArg3:timer(120000, function(playerArg4) -- 1 minute remaining
                    local playerName = playerArg4:getName()
                    local channel    = 6
                    local message = string.format("Time to server restart: 1 minute")

                    SendServerMsg(playerName, channel, message)

                    playerArg4:timer(30000, function(playerArg5) -- 30 seconds remaining
                        local playerName = playerArg5:getName()
                        local channel    = 6
                        local message    = string.format("Time to server restart: 30 seconds")

                        SendServerMsg(playerName, channel, message)

                        playerArg5:timer(30000, function(playerArg6) -- Complete
                            local playerName = playerArg6:getName()
                            local channel    = 6
                            local message    = string.format("Server restarting.")

                            SendServerMsg(playerName, channel, message)
                        end)
                    end)
                end)
            end)
        end)
    end)
end
