---------------------------------------------------------------------------------------------------
-- func: !addmodmob {mod ID} {power}
-- desc: Adds the given mod to the target monster.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addmodmob {mod ID} {power}")
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

    targ:addMod(modID, power)
	player:PrintToPlayer(string.format("Added mod ID [%i] with power [%i] to [%s].", modID, power, targ:getName()),tpz.msg.channel.NS_LINKSHELL3)
end