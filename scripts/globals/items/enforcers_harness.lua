-----------------------------------------
-- ID: 26962
-- Equip: Enforcer's Harness
-- Sphere: Critical Hit Rate
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	-- local effect = tpz.effect.EGG
	-- local visibleAura = 2
	-- local tickEffect = tpz.effect.ENSPHERE
	-- local power = 2
	-- local targetType = tpz.auraTarget.ALLIES

	-- if (itemCheck == 1) then --Equip
		-- target:addStatusEffectEx(effect, effect, visibleAura, 3, 0, tickEffect, power, targetType, tpz.effectFlag.AURA)
	-- end
	
	-- if (itemCheck == 2) then -- Unequip
		-- target:delStatusEffectSilent(tpz.effect.EGG)
	-- end
	
	if (itemCheck == 1) then --Equip
		target:addStatusEffectEx(tpz.effect.EGG, tpz.effect.EGG, 2, 3, 0)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delStatusEffectSilent(tpz.effect.EGG)
	end
end