-----------------------------------------
-- ID: 10991
-- Equip: Rancorous Mantle
-- Tonberry's Grudge
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	-- Tonberry hate caps at 480. Figure 200 Tonberry kills to cap bonuses
	-- local tonberryHate = target:getCharVar("EVERYONES_GRUDGE_KILLS")
	-- local modDT = tonberryHate / 20
	-- local modCritHitRate = tonberryHate / 40
	
	-- if (modDT > 10) then
		-- modDT = 10
	-- end
	
	-- if (modCritHitRate > 5) then
		-- modCritHitRate = 5
	-- end

	if (itemCheck == 1) then --Equip -- and target:getCharVar("EVERYONES_GRUDGE_GEAR") == 0
		target:addMod(tpz.mod.DMG, -10)
		target:addMod(tpz.mod.CRITHITRATE, 5)
		-- target:setCharVar("EVERYONES_GRUDGE_GEAR", 1)
	end
	
	if (itemCheck == 2) then -- Unequip -- and target:getCharVar("EVERYONES_GRUDGE_GEAR") == 1
		target:delMod(tpz.mod.DMG, -10)
		target:delMod(tpz.mod.CRITHITRATE, 5)
		-- target:setCharVar("EVERYONES_GRUDGE_GEAR", 0)
	end
end