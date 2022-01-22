---------------------------------------------------------------------------------------------------
-- func: !setTH {power}
-- desc: Sets Treasure Hunter on the target monster to the value provided.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setTH {power}")
end

function onTrigger(player, power)
	if (power == nil) then
		error(player, "Please provide a power value.")
    else
		targ = player:getCursorTarget()
		if (targ == nil) then
			error(player, "You must target a mob with your cursor.")
			return
		end
    end

    targ:setTHlevel(power)
	player:PrintToPlayer(string.format("Set Treasure Hunter to [%i] on [%s].", power, targ:getName()),tpz.msg.channel.NS_LINKSHELL3)
end