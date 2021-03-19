---------------------------------------------------------------------------------------------------
-- func: !setmodmob {mod ID} {power}
-- desc: Sets the given mod on the target monster to the value provided.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setmodmob {mod ID} {power}")
end

function onTrigger(player, modID, power)
	if (modID == nil) then
        error(player, "Please provide a modifier.")
        return
	elseif (power == nil) then
		error(player, "Please provide a power value.")
    else
		targ = player:getCursorTarget()
		if (targ == nil) then
			error(player, "You must target a mob with your cursor.")
			return
		end
    end

    targ:setMod(modID, power)
	player:PrintToPlayer(string.format("Set mod ID [%i] to power [%i] on [%s].", modID, power, targ:getName()),tpz.msg.channel.NS_LINKSHELL3)
end