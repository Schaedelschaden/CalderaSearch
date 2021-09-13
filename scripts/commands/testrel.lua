---------------------------------------------------------------------------------------------------
-- func: !testrel
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
	
	-- Agoge Mask, Agoge Lorica, Agoge Mufflers, Agoge Cuisses, Agoge Calligae
	local relicTrade = {26624, 26800, 26976, 27152, 27328}
	
	-- 1 Byne Bill, Ordelle Bronzepiece, Tukuku Whiteshell
	local dynaCurrency = {1455, 1452, 1449, 1456, 1453, 1450}

	-- Forgotten Thought, Forgotten Hope, Forgotten Touch, Forgotten Journey, Forgotten Step
	local relicTradeMaterial = {3493, 3494, 3495, 3496, 3497}

	-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood
	local relicGodItem = {844, 837, 1110, 836, 1311}

    -- Attempt to give the target the items
    if (player:getFreeSlotsCount() < 4) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "'%s' does not have enough free space for that set! Please clear 4 inventory slots and try again.", player ) )
    else
		-- local jobItem = {4046, 4025, 4047, 3923, 4029}
		local i = materialOffset
		local offset = 0 + manualOffset
		local currency1 = dynaCurrency[2]
		local currency2 = dynaCurrency[5]
		local material = relicTradeMaterial[i]
		
		player:addItem(relicTrade[i] + offset)
		player:messageSpecial(ID.text.ITEM_OBTAINED, relicTrade[i] + offset)
		-- player:addItem(jobItem[offset], 3)
		-- player:messageSpecial(ID.text.ITEM_OBTAINED, jobItem[offset])
		player:addItem(currency1, 50)
		player:messageSpecial(ID.text.ITEM_OBTAINED, currency1)
		player:addItem(material, 5)
		player:messageSpecial(ID.text.ITEM_OBTAINED, material)
		player:addItem(currency2)
		player:messageSpecial(ID.text.ITEM_OBTAINED, currency2)
	end
end