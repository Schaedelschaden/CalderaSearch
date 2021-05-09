---------------------------------------------------------------------------------------------------
-- func: !testraf
-- desc: Gives the materials for upgrading to Reforged gear to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    -- Load needed text ids for target's current zone
    local ID = zones[player:getZoneID()]
	
	-- Fighter's Mask +1, Fighter's Lorica +1, Fighter's Mufflers +1, Fighter's Cuisses +1, Fighter's Calligae +1
	local tradePiece = {15225, 14473, 14890, 15561, 15352}
	
	-- Rem's Tale Ch.01 x5, Rem's Tale Ch.02 x5, Rem's Tale Ch.03 x5, Rem's Tale Ch.04 x5, Rem's Tale Ch.05 x5
	local remTales = {4064, 4065, 4066, 4067, 4068}

	-- Tiger Leather, Gold Thread, Imperial Silk Cloth, Karakul Cloth, Scarlet Linen, Gold Sheet, Darksteel Sheet, Tama-Hagane
	local tradeMaterial = {855, 823, 2340, 2288, 1699, 752, 664, 657}

	-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood
	local godItem = {844, 837, 1110, 836, 1311}

    -- Attempt to give the target the items
    if (player:getFreeSlotsCount() < 4) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 4 inventory slots and try again.", player ) )
    else
		local i = 1
		local offset = 0
		local craftMaterial = tradeMaterial[1]
		
		player:addItem(tradePiece[i] + offset)
		player:messageSpecial(ID.text.ITEM_OBTAINED, tradePiece[i] + offset)
		player:addItem(remTales[i], 5)
		player:messageSpecial(ID.text.ITEM_OBTAINED, remTales[i])
		player:addItem(craftMaterial)
		player:messageSpecial(ID.text.ITEM_OBTAINED, craftMaterial)
		player:addItem(godItem[i])
		player:messageSpecial(ID.text.ITEM_OBTAINED, godItem[i])
	end
end