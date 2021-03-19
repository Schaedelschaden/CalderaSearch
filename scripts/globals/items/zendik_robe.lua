-----------------------------------------
-- ID: 25728
-- Equip: Zendik Robe
-- Sphere: Magic Attack Bonus +10
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	local effect = tpz.effect.ENSPHERE
	local visibleAura = 7 -- Dark
	local tickEffect = tpz.effect.MAGIC_ATK_BOOST
	local power = 10
	local targetType = tpz.auraTarget.ALLIES

	if (itemCheck == 1) then --Equip
		target:addStatusEffectEx(effect, effect, visibleAura, 3, 0, tickEffect, power, targetType, tpz.effectFlag.AURA)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delStatusEffect(tpz.effect.ENSPHERE)
	end
end