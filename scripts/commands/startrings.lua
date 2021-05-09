---------------------------------------------------------------------------------------------------
-- func: !startrings
-- desc: Gives the player the nation starting rings.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local rings = {13495, 13496, 13497}
	
	-- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]

    if (player:getFreeSlotsCount() < 3) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        return
    end
	
	for i = 1, 3 do
		player:addItem( rings[i] )
		player:messageSpecial( ID.text.ITEM_OBTAINED, rings[i] )
	end
end