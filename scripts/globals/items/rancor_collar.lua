-----------------------------------------
-- ID: 10931
-- Equip: Rancor Collar
-- Tonberry's Grudge
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	-- Tonberry hate caps at 480. Figure 200 Tonberry kills to cap bonuses
	local tonberryHate = target:getCharVar("EVERYONES_GRUDGE_KILLS")
	local modDT = tonberryHate / 20
	local modCritHitRate = tonberryHate / 40
	
	if (modDT > 10) then
		modDT = 10
	end
	
	if (modCritHitRate > 5) then
		modCritHitRate = 5
	end

	if (itemCheck == 1 and target:getCharVar("EVERYONES_GRUDGE_GEAR") == 0) then --Equip
		target:addMod(tpz.mod.DMG, modDT)
		target:addMod(tpz.mod.CRITHITRATE, modCritHitRate)
		target:setCharVar("EVERYONES_GRUDGE_GEAR", 1)
	end
	
	if (itemCheck == 2 and target:getCharVar("EVERYONES_GRUDGE_GEAR") == 1) then -- Unequip
		target:delMod(tpz.mod.DMG, modDT)
		target:delMod(tpz.mod.CRITHITRATE, modCritHitRate)
		target:setCharVar("EVERYONES_GRUDGE_GEAR", 0)
	end
end