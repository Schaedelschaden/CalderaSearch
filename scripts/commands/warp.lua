---------------------------------------------------------------------------------------------------
-- func: warp
-- desc: Sends the target to their homepoint.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!warp {player}")
end

function onTrigger(player, target)
	-- local zoneId = player:getZoneID()

	-- if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
		-- zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
		-- zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
		-- player:PrintToPlayer(string.format("That command cannot be used in this zone. Please exit the area and try again."),tpz.msg.channel.SYSTEM_3)
		-- return
	-- else
		-- validate target
		if (player:getGMLevel() > 0) then
			local targ
			if (target == nil) then
				targ = player
			else
				targ = GetPlayerByName( target )
				if (targ == nil) then
					error(player, string.format( "Player named '%s' not found!", target ) )
					return
				end
			end

			-- warp target
			targ:warp()
			if (targ:getID() ~= player:getID()) then
				player:PrintToPlayer(string.format("Sent %s to their homepoint.",targ:getName()))
			end
		else
			player:warp()
		end
	-- end
end