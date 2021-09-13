---------------------------------------------------------------------------------------------------
-- func: bring <player>
-- desc: Brings the target to the player.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!bring <player> {forceZone}")
end

function onTrigger(player, target, forceZone)
	local targ = GetPlayerByName(target)
	local zoneId = targ:getZoneID()

	-- if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
		-- zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
		-- zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
		-- player:PrintToPlayer(string.format("That command cannot be used to bring a player from that zone. Please have the player exit their current area and try again."),tpz.msg.channel.SYSTEM_3)
		-- return
	-- else
		if (player:getGMLevel() > 0) then-- or player:getMentor() > 0) then
			-- validate target
			if (target == nil) then
				error(player, "You must enter a target player name.")
				return
			end
			local targ = GetPlayerByName( target )
			if (targ == nil) then
				if not player:bringPlayer( target ) then
					error(player, string.format( "Player named '%s' not found!", target ) )
				end
				return
			end

			-- validate forceZone
			if (forceZone ~= nil) then
				if (forceZone ~= 0 and forceZone ~= 1) then
					error(player, "If provided, forceZone must be 1 (true) or 0 (false).")
					return
				end
			else
				forceZone = 1
			end

			-- bring target
			if (targ:getZoneID() ~= player:getZoneID() or forceZone == 1) then
				targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() )
			else
				targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos() )
			end
		end
	-- end
end