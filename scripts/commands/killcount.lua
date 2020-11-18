---------------------------------------------------------------------------------------------------
-- func: !killcount
-- desc: Gets the player's Character Variables that have stored their kill counts
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	local kcRabbit = player:getCharVar("KillCounter_Rabbits")
	local kcMarvin = player:getCharVar("KillCounter_MangyTailedMarvin")
	player:PrintToPlayer(string.format("  Rabbits: [%i]  Mangy-Tailed Marvin: [%i]", kcRabbit, kcMarvin),tpz.msg.channel.SYSTEM_3)
end