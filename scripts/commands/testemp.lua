---------------------------------------------------------------------------------------------------
-- func: !testemp
-- desc: Gives the materials for upgrading to Reforged gear to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
}

function onTrigger(player, jobOffset, material, armorSlot)
    -- Load needed text ids for target's current zone
    local ID = zones[player:getZoneID()]
	
	-- Ravager's Mask +2, Ravager's Lorica +2, Ravager's Mufflers +2, Ravager's Cuisses +2, Ravager's Calligae +2,
	local empTrade = {11064, 11084, 11104, 11124, 11144}
	
	-- Ravager's Seal: Head x8, Ravager's Seal: Body x8, Ravager's Seal: Hands x8, Ravager's Seal: Legs x8, Ravager's Seal: Feet x8
	-- Purple Spriggan Spirit x8, Pachypodium Spirit x8, Ake-Ome Spirit x8, Bottle of Star Sprinkles x8, Chestnut Tree Sap x8
	-- Red Spriggan Spirit x8, Beetle Spirit x8, Antlion Spirit x8, Monarch Beetle Saliva x8, Dragoneye x8
	local empSeals = {3110, 3130, 3150, 3170, 3190,
					  8760, 4056, 8736, 8737, 3986,
					  8761, 4054, 4055, 3985, 4048}

	-- Bakka's Wing, Balaur Skull, Lieje Lantern, Chasmic Stinger, Keesha's Pamama, Marvin's Pelage,
	-- Mikey's Nugget, Chukwa's Egg, Cuelebre's Horn, Mictlantecuhtli's Habit, Manananggal's Necklet
	local empTradeMaterial = {2938, 2943, 2944, 2936, 2941, 2935,
							  2942, 2933, 2939, 2940, 2934}

	-- Briareus Helm, Glavoid Shell, Kukulkan Fang, Carabosse Gem, 2-Leaf Chloris Bud
	local empBossItem = {2929, 2927, 2932, 2930, 2928}

    -- Attempt to give the target the items
    if (player:getFreeSlotsCount() < 4) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 4 inventory slots and try again.", player ) )
    else
		-- local jobItem = {4046, 4025, 4047, 3923, 4029}
		local armorPiece = empTrade[armorSlot] + jobOffset		
		local seals = empSeals[armorSlot] + jobOffset
		local tradeMaterial = empTradeMaterial[material]
		local bossItem = empBossItem[armorSlot]
		
		if (jobOffset == 20) then
			empTrade = {4044, 4043, 4042, 4030, 4045}
			armorPiece = empTrade[armorSlot]
			seals = empSeals[armorSlot + 5]
		elseif (jobOffset == 21) then
			empTrade = {4046, 4025, 4047, 3923, 4029}
			armorPiece = empTrade[armorSlot]
			seals = empSeals[armorSlot + 10]
		end
		
		player:addItem(armorPiece, 3)
		player:messageSpecial(ID.text.ITEM_OBTAINED, armorPiece)
		player:addItem(seals, 8)
		player:messageSpecial(ID.text.ITEM_OBTAINED, seals)
		player:addItem(tradeMaterial, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, tradeMaterial)
		player:addItem(bossItem)
		player:messageSpecial(ID.text.ITEM_OBTAINED, bossItem)
	end
end