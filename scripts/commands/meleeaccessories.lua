---------------------------------------------------------------------------------------------------
-- func: !meleeaccessories
-- desc: Gives the a set of melee accessories to the triggering player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local itemId = 0
	local amount = 1

    -- Load needed text ids for player's current zone.
    local ID = zones[player:getZoneID()]

    -- Attempt to give the target the item..
    if (player:getFreeSlotsCount() < 8) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "You do not have free space for that set! Please clear 8 inventory slots and try again." ) )
    else
        itemId = 22298 -- Aurgelmir Orb +1
		player:addItem( itemId, amount)
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26029 -- Anu Torque
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 27536 -- Assuage Earring
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26084 -- Sherida Earring
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26185 -- Niqmaddu Ring
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 26173 -- Apate Ring
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 28408 -- Grunfeld Belt
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
		itemId = 28612 -- Buquwik Cape
		player:addItem( itemId, amount )
        player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
    end
end