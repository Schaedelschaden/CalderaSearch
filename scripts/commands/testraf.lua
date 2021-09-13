---------------------------------------------------------------------------------------------------
-- func: !testraf
-- desc: Gives the materials for upgrading to Reforged gear to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

function onTrigger(player, manualOffset, materialOffset)
    -- Load needed text ids for target's current zone
    local ID = zones[player:getZoneID()]
	
	-- Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae
	local tradePiece = {27663, 27807, 27943, 28090, 28223}
	
	-- Rem's Tale Ch.06 x5, Rem's Tale Ch.07 x5, Rem's Tale Ch.08 x5, Rem's Tale Ch.09 x5, Rem's Tale Ch.10 x5
	local remTales = {4069, 4070, 4071, 4072, 4073}

	-- Behemoth Leather, Platinum Silk Thread, Raxa, Twill Damask, Siren's Hair, Orichalcum Sheet, Durium Sheet, Damascus Ingot
	local tradeMaterial = {862, 2476, 1132, 2200, 1313, 668, 758, 658}

	-- Maliyakaleya Orb, Hepatizon Ingot, Beryllium Ingot, Exalted Lumber, Sif's Macrame
	local godItem = {8720, 8722, 8724, 8726, 8728}

    -- Attempt to give the target the items
    if (player:getFreeSlotsCount() < 4) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 4 inventory slots and try again.", player ) )
    else
		local i = 1 + materialOffset
		local offset = 0 + manualOffset
		local craftMaterial = tradeMaterial[8]
		
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