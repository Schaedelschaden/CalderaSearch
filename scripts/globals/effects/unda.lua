-----------------------------------
--
-- tpz.effect.UNDA
--
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")

function onEffectGain(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.UNDA)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	target:setMod(tpz.mod.ENSPELL, 6)
    target:setMod(tpz.mod.ENSPELL_DMG, potency)
	target:addMod(tpz.mod.FIRERES, effect:getPower())
end

function onEffectTick(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.UNDA)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	if ((RuneCounter > 1) or (target:getMod(tpz.mod.ENSPELL) == 0)) then
		target:setMod(tpz.mod.ENSPELL, 6)
		target:setMod(tpz.mod.ENSPELL_DMG, potency)
	end
end

function onEffectLose(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.UNDA)

	if ((RuneCounter == 0) and (target:getMod(tpz.mod.ENSPELL) == 6)) then
		target:setMod(tpz.mod.ENSPELL, 0)
		target:setMod(tpz.mod.ENSPELL_DMG, 0)
	else
		target:delMod(tpz.mod.ENSPELL_DMG, effect:getPower() * 1.25)
	end
	
	target:delMod(tpz.mod.FIRERES, effect:getPower())
end