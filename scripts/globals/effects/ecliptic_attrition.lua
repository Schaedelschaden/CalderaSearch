-----------------------------------
-- Effect: Ecliptic Attrition
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())
	
	local colureActive = target:getStatusEffect(tpz.effect.COLURE_ACTIVE)
	local visibleAura = colureActive:getPower()
	local tickEffect = colureActive:getSubType()
	local power = colureActive:getSubPower() * 1.25
	local targetType = colureActive:getTier()
		
--	printf("ecliptic_attrition.lua onEffectGain VISIBLE AURA: [%i]  TICK EFFECT: [%s]  POWER:  [%i]  TARGET TYPE: [%s]", visibleAura, tickEffect, power, targetType)
		
	target:delStatusEffectSilent(tpz.effect.COLURE_ACTIVE)
	target:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, visibleAura, 3, 0, tickEffect, power, targetType, tpz.effectFlag.AURA)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
end