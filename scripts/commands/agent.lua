---------------------------------------------------------------------------------------------------
-- func: !agent <player>
-- desc: Gives the Agent set to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player, target)
    local itemId = 0
	local amount = 1
	
	if (target == nil or itemId == nil) then
        player:PrintToPlayer("You must enter a valid player name.")
        return
    end

    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "No target specified. Please target a player." ) )
        return
    end

    -- Load needed text ids for target's current zone..
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() < 5) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have free space for that set! Please clear 5 inventory slots and try again.", target ) )
    else
        itemId = 25606 -- Agent Hood
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26974 -- Agent Coat
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27111 -- Agent Cuffs
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27296 -- Agent Pants
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27467 -- Agent Boots
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "Gave '%s' the Agent set.", target ) )
    end
end