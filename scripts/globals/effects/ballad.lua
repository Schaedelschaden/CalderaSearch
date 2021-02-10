-----------------------------------
--
-- tpz.effect.BALLAD
-- getPower returns the TIER (e.g. 1,2,3,4)
-- DO NOT ALTER ANY OF THE EFFECT VALUES! DO NOT ALTER EFFECT POWER!
-- Todo: Find a better way of doing this. Need to account for varying modifiers + CASTER's skill (not target)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	power = effect:getPower()
	setBonus = 0
	
	if (power >= 2000 and power < 3000) then
		power = power - 2000
		setBonus = 1
	elseif (power >= 3000 and power < 4000) then
		power = power - 3000
		setBonus = 2
	elseif (power >= 4000 and power < 5000) then
		power = power - 4000
		setBonus = 3
	elseif (power >= 5000) then
		power = power - 5000
		setBonus = 5
	end
	
	if (setBonus > 0) then
		target:addMod(tpz.mod.CHR, setBonus)
	end

    target:addMod(tpz.mod.REFRESH, power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.REFRESH, power)
	
	if (setBonus > 0) then
		target:delMod(tpz.mod.CHR, setBonus)
	end
end