-----------------------------------
--
-- tpz.effect.IGNIS
--
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")

function onEffectGain(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.IGNIS)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	target:setMod(tpz.mod.ENSPELL, 1)
    target:setMod(tpz.mod.ENSPELL_DMG, potency)
	target:addMod(tpz.mod.ICERES, effect:getPower())
end

function onEffectTick(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.IGNIS)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	if ((RuneCounter > 1) or (target:getMod(tpz.mod.ENSPELL) == 0)) then
		target:setMod(tpz.mod.ENSPELL, 1)
		target:setMod(tpz.mod.ENSPELL_DMG, potency)
	end
end

function onEffectLose(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.IGNIS)

	if ((RuneCounter == 0) and (target:getMod(tpz.mod.ENSPELL) == 1)) then
		target:setMod(tpz.mod.ENSPELL, 0)
		target:setMod(tpz.mod.ENSPELL_DMG, 0)
		target:setMod(tpz.mod.ICERES, 0)
	else
		target:delMod(tpz.mod.ENSPELL_DMG, effect:getPower() * 1.25)
		target:delMod(tpz.mod.ICERES, effect:getPower())
	end
end