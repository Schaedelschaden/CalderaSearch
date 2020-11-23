---------------------------------------------------------------------------------------------------
-- func: !starlet <player>
-- desc: Gives the Starlet set to the specified player.
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
        itemId = 25607 -- Starlet Flower
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26975 -- Starlet Jabot
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27112 -- Starlet Gloves
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27297 -- Starlet Skirt
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27468 -- Starlet Boots
		targ:addItem( itemId, amount )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "Gave '%s' the Starlet set.", target ) )
    end
end