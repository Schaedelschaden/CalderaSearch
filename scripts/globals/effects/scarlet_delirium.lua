-----------------------------------
--
-- tpz.effect.SCARLET_DELIRIUM
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	-- Damage to Max HP Ratio / 2 for Scarlet Delirium Bonus
	-- Max HP is determined at time of hit
	local strength = (effect:getPower() / 2)
	
	target:addMod(tpz.mod.ATTP, strength)
	target:addMod(tpz.mod.MATT, strength)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	local strength = (effect:getPower() / 2)
	
	target:delMod(tpz.mod.ATTP, strength)
	target:delMod(tpz.mod.MATT, strength)
end
