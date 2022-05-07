---------------------------------------------------------------------------------------------------
-- func: !deathcount
-- desc: Gets the player's Character Variable that has stored their death count
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	local deathCount = player:getCharVar("TotalDeaths")
	
	player:PrintToPlayer(string.format("Total Deaths: [%i]", deathCount),tpz.msg.channel.SYSTEM_3)
end