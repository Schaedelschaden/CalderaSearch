---------------------------------------------------------------------------------------------------
-- func: !addhomepoints
-- desc: Adds all home points to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addhomepoints")
end

function onTrigger(player)
	for i = 0, 121 do
		local travelType = tpz.teleport.type.HOMEPOINT
		local hpBit  = i % 32
		local hpSet  = math.floor(i / 32)
		
		if not player:hasTeleport(travelType, hpBit, hpSet) then
			player:addTeleport(travelType, hpBit, hpSet)
		end
		
		if (i == 121) then
			player:PrintToPlayer(string.format("All home points unlocked!"),tpz.msg.channel.SYSTEM_3)
		end
	end
end