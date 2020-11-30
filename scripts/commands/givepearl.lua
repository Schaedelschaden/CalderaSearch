---------------------------------------------------------------------------------------------------
-- func: !givepearl
-- desc: Gives a server linkpearl to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player, target)
	local targ = GetPlayerByName(target)

	if (targ:getHP() < targ:getMaxHP()) then
		player:PrintToPlayer(string.format("The target must have full HP to use this command!", player))
		return
	end
	
	if (targ:getCharVar("ServerLS_RCVD") > 0) then
		player:PrintToPlayer(string.format("That player already has a server linkpearl!", player))
		return
	end

    -- Load needed text ids for target's current zone.
    local ID = zones[player:getZoneID()]
	local itemId = 515 -- Sets the item ID to a linkshell (513), linksack (514), or linkpearl (515)
	local sig = "Caldera"
--	local test = {16535, Khalum}

    -- Attempt to give the target the linkpearl.
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemId)
        player:PrintToPlayer(string.format("You don't not have enough inventory space for that item!"))
    else
		player:addItem({id=itemId, signature=sig})
		player:PrintToPlayer(string.format("Gave %s a server linkpearl! They will need to zone to refresh their inventory.", target))
		targ:PrintToPlayer(string.format("You just received a server linkpearl! You will need to zone to refresh your inventory."))
		targ:setCharVar("ServerLS_RCVD", 1)
--		player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
    end
end