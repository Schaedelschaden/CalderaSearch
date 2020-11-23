-----------------------------------
--
-- tpz.effect.COMPANIONS_ROLL
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target, effect)
    local power = effect:getPower()
	local effectregain = {20, 50, 20, 20, 30, 30, 30, 40, 40, 10, 60, 0}
    local effectregen = {4, 20, 6, 8, 10, 12, 14, 16, 18, 3, 25, 0}
	local plusMod = 0
	plusTP = 0
	plusHP = 0
	
	if (power >= 800 and power <= 899) then
		power = power - 800
		plusMod = 8
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 700 and power <= 799) then
		power = power - 700
		plusMod = 7
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 500 and power <= 599) then
		power = power - 500
		plusMod = 5
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 300 and power <= 399) then
		power = power - 300
		plusMod = 3
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	end
	
--	printf("companions_roll.lua onEffectGain EFFECT POWER: [%i]  PHANTOM ROLL+: [%i]  PLUS TP: [%i]  PLUS HP: [%i]\n", power, plusMod, plusTP, plusHP)
	
	plusTP = effectregain[power] + plusMod
	plusHP = effectregen[power] + plusMod
	
--	printf("companions_roll.lua onEffectGain PLUS TP: [%i]  PLUS HP: [%i]\n", plusTP, plusHP)
	
	target:addPetMod(tpz.mod.REGAIN, plusTP)
	target:addPetMod(tpz.mod.REGEN, plusHP)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
    local power = effect:getPower()
	local effectregain = {20, 50, 20, 20, 30, 30, 30, 40, 40, 10, 60, 0}
    local effectregen = {4, 20, 6, 8, 10, 12, 14, 16, 18, 3, 25, 0}
	local plusMod = 0
	plusTP = 0
	plusHP = 0
	
	if (power >= 800 and power <= 899) then
		power = power - 800
		plusMod = 8
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 700 and power <= 799) then
		power = power - 700
		plusMod = 7
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 500 and power <= 599) then
		power = power - 500
		plusMod = 5
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	elseif (power >= 300 and power <= 399) then
		power = power - 300
		plusMod = 3
		plusTP = effectregain[power]
		plusHP = effectregen[power]
	end
	
--	printf("companions_roll.lua onEffectGain EFFECT POWER: [%i]  PHANTOM ROLL+: [%i]  PLUS TP: [%i]  PLUS HP: [%i]\n", power, plusMod, plusTP, plusHP)
	
	plusTP = effectregain[power] + plusMod
	plusHP = effectregen[power] + plusMod
	
--	printf("companions_roll.lua onEffectGain PLUS TP: [%i]  PLUS HP: [%i]\n", plusTP, plusHP)
	
	target:delPetMod(tpz.mod.REGAIN, plusTP)
	target:delPetMod(tpz.mod.REGEN, plusHP)
end