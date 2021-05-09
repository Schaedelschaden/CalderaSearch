--------------------------------------------------------------
-- func: !help
-- auth: Schaedel
-- desc: Lists all currently available server commands.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player, mobId)
    player:PrintToPlayer(string.format("CALDERA SERVER COMMANDS-----------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!givepearl    !regen        !ah        !shop"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!stats         !petstats    !check    !killcount"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!release      !rezone"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!warp         !home        !dem      !holla        !mea"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!altep         !yhoat       !vahzl"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("!library       !beach       !circuit"),tpz.msg.channel.SYSTEM_3)
end