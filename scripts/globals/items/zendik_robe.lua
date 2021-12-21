-----------------------------------------
-- ID: 25728
-- Equip: Zendik Robe
-- Sphere: Magic Attack Bonus +10
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	-- local effect = tpz.effect.EGG
	-- local visibleAura = 4
	-- local tickEffect = tpz.effect.ENSPHERE
	-- local power = 4
	-- local targetType = tpz.auraTarget.ALLIES

	if (itemCheck == 1) then --Equip
		target:addStatusEffectEx(tpz.effect.EGG, tpz.effect.EGG, 4, 3, 0)
		-- target:addStatusEffectEx(effect, effect, visibleAura, 3, 0, tickEffect, power, targetType, tpz.effectFlag.AURA)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delStatusEffectSilent(tpz.effect.EGG)
	end
end