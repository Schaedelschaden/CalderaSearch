---------------------------------------------------------------------------------------------------
-- func: hp <amount> <player>
-- desc: Sets the GM or target players health.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "is"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!hp <amount> {player}")
end

function onTrigger(player, hp, target)
    -- validate target
    local targ
    local cursor_target = player:getCursorTarget()

    if target then
        targ = GetPlayerByName(target)
        if not targ then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    elseif cursor_target and not cursor_target:isNPC() then
        targ = cursor_target
    else
        targ = player
    end

	if (targ:isPC() and hp > 0) then
		-- validate amount
		if hp == nil or tonumber(hp) == nil then
			error(player, "You must provide an amount.")
			return
		elseif hp < 0 then
			error(player, "Invalid amount.")
			return
		end

		-- set hp
		if targ:isAlive() then
			targ:setHP(hp)
			if targ:getID() ~= player:getID() then
				player:PrintToPlayer(string.format("Set %s's HP to %i.", targ:getName(), targ:getHP()))
			end
		else
			player:PrintToPlayer(string.format("%s is currently dead.", targ:getName()))
		end
	-- elseif (targ:isPC() and hp == 0) then
		-- player:PrintToPlayer(string.format("Do they really need to die?"))
	else
		-- validate amount
		if hp == nil or tonumber(hp) == nil then
			error(player, "You must provide an amount.")
			return
		elseif hp < 0 then
			error(player, "Invalid amount.")
			return
		end

        if targ:getName() == "Khalum" then
            player:setUnkillable(false)
            player:setHP(hp)
            player:PrintToPlayer(string.format("Your tricks don't work against me Dewey."))
            return
        end

		-- set hp
		if targ:isAlive() then
			targ:setHP(hp)
			if targ:getID() ~= player:getID() then
				player:PrintToPlayer(string.format("Set %s's HP to %i.", targ:getName(), targ:getHP()))
			end
		else
			player:PrintToPlayer(string.format("%s is currently dead.", targ:getName()))
		end
	end
end
