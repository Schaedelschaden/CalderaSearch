---------------------------------------------------------------------------------------------------
-- func: !swimsuit <player>
-- desc: Gives the Sexy Beast swuimsuit set to the specified player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!swimsuit <player>")
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
    if (targ:getFreeSlotsCount() < 2) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "%s does not have enough free space for that set! Please clear 2 inventory slots and try again.", target ) )
    else
		if (targ:getGender() == 1) then -- Male
			itemId = 26965 -- Ta Moko
			targ:addItem( itemId, amount )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27291 -- Swimming Togs
			targ:addItem( itemId, amount )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave %s the Male Sexy Beast set.", target ) )
		else -- Female
			itemId = 26967 -- Cossie Top
			targ:addItem( itemId, amount )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 27293 -- Cossie Bottom
			targ:addItem( itemId, amount )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:PrintToPlayer( string.format( "Gave %s the Female Sexy Beast set.", target ) )
		end
	end
end