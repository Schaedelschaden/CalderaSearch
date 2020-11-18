---------------------------------------------------------------------------------------------------
-- func: !givepearl
-- desc: Gives a server linkpearl to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if (player:getHP() < player:getMaxHP()) then
		player:PrintToPlayer(string.format("You must have full HP to use this command!", player))
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
--      targ:addItem({test[1], test[2]})
--		player:addItem({id=itemId, signature="Khalum"})
--		player:addItem({id=itemId, signature=sig, augments={[1]=4,[9]=4}})
		player:addItem({id=itemId, signature=sig})
--		player:PrintToPlayer(string.format("Gave %s a server linkpearl! They will be zoned to update their inventory.", player))
		player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
    end
end