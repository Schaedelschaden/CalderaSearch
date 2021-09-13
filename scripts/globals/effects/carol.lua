-----------------------------------
--
--      tpz.effect.CAROL
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

local element = {tpz.magic.ele.FIRE, tpz.magic.ele.EARTH, tpz.magic.ele.WATER, tpz.magic.ele.WIND, tpz.magic.ele.ICE, tpz.magic.ele.LIGHTNING, tpz.magic.ele.LIGHT, tpz.magic.ele.DARK}
local null = {tpz.mod.FIRE_NULL, tpz.mod.ICE_NULL, tpz.mod.WIND_NULL, tpz.mod.EARTH_NULL, tpz.mod.LTNG_NULL, tpz.mod.WATER_NULL, tpz.mod.LIGHT_NULL, tpz.mod.DARK_NULL}
local stats = {tpz.mod.STR, tpz.mod.VIT, tpz.mod.MND, tpz.mod.AGI, tpz.mod.INT, tpz.mod.DEX, tpz.mod.CHR, tpz.mod.MP}

function onEffectGain(target,effect)
	local power = effect:getPower()
	local subPower = effect:getSubPower()
	setBonus = 0
	addedStat = 0
	
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
	
	if (effect:getTier() > 1) then
		target:addMod(null[subPower], effect:getTier())
	end
	
    target:addMod(tpz.magic.resistMod[subPower], power)
	
	for i, v in pairs(element) do
		if (subPower == element[i] and setBonus > 0) then
			if (stats[i] == tpz.mod.MP) then
				setBonus = setBonus * 10
			end
			target:addMod(stats[i], setBonus)
			addedStat = stats[i]
		end
	end
	
	effect:setPower(power)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	local power = effect:getPower()
	local subPower = effect:getSubPower()
	
    target:delMod(tpz.magic.resistMod[subPower], power)
	
	if (effect:getTier() > 1) then
		target:delMod(null[subPower], effect:getTier())
	end
	
	if (setBonus > 0) then
		target:delMod(addedStat, setBonus)
	end
end