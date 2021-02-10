---------------------------------------------------------------------------------------------------
-- func: updateservermessage
-- desc: Updates the server message if it has been edited.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    UpdateServerMessage()
	player:PrintToPlayer(string.format("Server message updated!"),tpz.msg.channel.SYSTEM_3)
end