-----------------------------------
--
-- tpz.effect.LUX
--
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")

function onEffectGain(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.LUX)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	target:setMod(tpz.mod.ENSPELL, 7)
    target:setMod(tpz.mod.ENSPELL_DMG, potency)
	target:addMod(tpz.mod.DARKRES, effect:getPower())
	target:addMod(tpz.mod.SLEEPRES, effect:getPower() / 2)
	target:addMod(tpz.mod.BLINDRES, effect:getPower() / 2)
	target:addMod(tpz.mod.CURSERES, effect:getPower() / 2)
	target:addMod(tpz.mod.DEATHRES, effect:getPower() / 2)
end

function onEffectTick(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.LUX)
	local potency = effect:getPower() * 1.25
	
	if (RuneCounter == 1) then
		potency = potency * 1
	elseif (RuneCounter == 2) then
		potency = potency * 2
	elseif (RuneCounter == 3) then
		potency = potency * 3
	end
	
	if ((RuneCounter > 1) or (target:getMod(tpz.mod.ENSPELL) == 0)) then
		target:setMod(tpz.mod.ENSPELL, 7)
		target:setMod(tpz.mod.ENSPELL_DMG, potency)
	end
end

function onEffectLose(target, effect)
	local RuneCounter = target:countEffect(tpz.effect.LUX)

	if ((RuneCounter == 0) and (target:getMod(tpz.mod.ENSPELL) == 7)) then
		target:setMod(tpz.mod.ENSPELL, 0)
		target:setMod(tpz.mod.ENSPELL_DMG, 0)
	else
		target:delMod(tpz.mod.ENSPELL_DMG, effect:getPower() * 1.25)
	end
	
	target:delMod(tpz.mod.DARKRES, effect:getPower())
	target:delMod(tpz.mod.SLEEPRES, effect:getPower() / 2)
	target:delMod(tpz.mod.BLINDRES, effect:getPower() / 2)
	target:delMod(tpz.mod.CURSERES, effect:getPower() / 2)
	target:delMod(tpz.mod.DEATHRES, effect:getPower() / 2)
end