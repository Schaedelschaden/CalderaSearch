---------------------------------------------------------------------------------------------------
-- func: !arca3 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Arcadian +3 set to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!arca3 <player>")
end

function onTrigger(player, target, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)
    local itemId = 0
	local amount = 1
	
	if (target == nil or itemId == nil) then
        error(player, "You must enter a valid player name.")
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
        itemId = 23408 -- Arcadian Beret +3
		targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 23475 -- Arcadian Jerkin +3
		targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 23542 -- Arcadian Bracer +3
		targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 23609 -- Arcadian Braccae +3
		targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 23676 -- Arcadian Socks +3
		targ:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "Gave '%s' the Arcadian +3 set.", target ) )
    end
end