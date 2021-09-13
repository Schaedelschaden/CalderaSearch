---------------------------------------------------------------------------------------------------
-- func: !katana <player>
-- desc: Gives the Wooden Katana to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!katana <player>")
end

function onTrigger(player, target)
    local itemId = 0
	local amount = 1
	local cursorTarget = player:getCursorTarget()
	
	-- if (target == nil and cursorTarget ~= nil) then
		-- local cursorName = cursorTarget:getName()
		-- target = cursorName
	-- else
        -- error(player, "You must enter a valid player name or select a player with your cursor.")
        -- return
    -- end

    local targ = GetPlayerByName( target )
	
    if (targ == nil) then
        player:PrintToPlayer( string.format( "No target specified. Please target a player." ) )
        return
    end

    -- Load needed text ids for target's current zone
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the items
    if (targ:getFreeSlotsCount() < 1) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "%s does not have enough free space for that set! Please clear 1 inventory slot and try again.", target ) )
    else
		itemId = 17830 -- Wooden Katana
		targ:addItem( itemId, amount )
		targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		player:PrintToPlayer( string.format( "Gave %s the Male Sexy Beast set.", target ) )
	end
end