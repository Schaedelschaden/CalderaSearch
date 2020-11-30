-----------------------------------
--
-- tpz.effect.BOLSTER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	if (target:hasStatusEffect(tpz.effect.COLURE_ACTIVE)) then
		local colureActive = target:getStatusEffect(tpz.effect.COLURE_ACTIVE)
		local visibleAura = colureActive:getPower()
		local duration = colureActive:getDuration()
		local tickEffect = colureActive:getSubType()
		local power = colureActive:getSubPower() * 2
		local targetType = colureActive:getTier()
--		printf("bolster.lua PLAYER onEffectGain VISIBLE AURA: [%i]  TICK EFFECT: [%s]  POWER:  [%i]  TARGET TYPE: [%s]", visibleAura, tickEffect, power, targetType)
		
		target:delStatusEffectSilent(tpz.effect.COLURE_ACTIVE)
		target:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, visibleAura, 3, duration, tickEffect, power, targetType, tpz.effectFlag.AURA)
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	if (target:hasStatusEffect(tpz.effect.COLURE_ACTIVE)) then
		local colureActive = target:getStatusEffect(tpz.effect.COLURE_ACTIVE)
		local visibleAura = colureActive:getPower()
		local duration = colureActive:getDuration()
		local tickEffect = colureActive:getSubType()
		local power = colureActive:getSubPower() / 2
		local targetType = colureActive:getTier()
--		printf("bolster.lua PLAYER onEffectLose VISIBLE AURA: [%i]  TICK EFFECT: [%s]  POWER:  [%i]  TARGET TYPE: [%s]", visibleAura, tickEffect, power, targetType)
		
		target:delStatusEffectSilent(tpz.effect.COLURE_ACTIVE)
		target:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, visibleAura, 3, duration, tickEffect, power, targetType, tpz.effectFlag.AURA)
	end

    if (target:hasPet()) and (target:getPetID() == tpz.pet.id.LUOPAN) then
		local luopan = target:getPet()
		local regenDown = math.floor(luopan:getMainLvl() / 4)
		
        luopan:setMod(tpz.mod.REGEN_DOWN, regenDown)
		
		local luopanColureActive = luopan:getStatusEffect(tpz.effect.COLURE_ACTIVE)
		local luopanVisibleAura = luopanColureActive:getPower()
		local luopanTickEffect = luopanColureActive:getSubType()
		local luopanPower = luopanColureActive:getSubPower() / 2
		local luopanTargetType = luopanColureActive:getTier()
		
--		printf("bolster.lua LUOPAN onEffectLose VISIBLE AURA: [%i]  TICK EFFECT: [%s]  POWER:  [%i]  TARGET TYPE: [%s]", luopanVisibleAura, luopanTickEffect, luopanPower, luopanTargetType)
		
		luopan:delStatusEffectSilent(tpz.effect.COLURE_ACTIVE)
		luopan:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, luopanVisibleAura, 3, 0, luopanTickEffect, luopanPower, luopanTargetType, tpz.effectFlag.AURA)
    end
end