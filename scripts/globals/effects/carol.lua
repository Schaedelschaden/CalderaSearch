-----------------------------------
--
--      tpz.effect.CAROL
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

local element = {tpz.magic.ele.FIRE, tpz.magic.ele.EARTH, tpz.magic.ele.WATER, tpz.magic.ele.WIND, tpz.magic.ele.ICE, tpz.magic.ele.LIGHTNING, tpz.magic.ele.LIGHT, tpz.magic.ele.DARK}
local stats = {tpz.mod.STR, tpz.mod.VIT, tpz.mod.MND, tpz.mod.AGI, tpz.mod.INT, tpz.mod.DEX, tpz.mod.CHR, tpz.mod.MP}

function onEffectGain(target,effect)
	local power = effect:getPower()
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
	
    target:addMod(tpz.magic.resistMod[effect:getSubPower()], power)
	
	for i, v in pairs(element) do
		if (effect:getSubPower() == element[i] and setBonus > 0) then
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
	
    target:delMod(tpz.magic.resistMod[effect:getSubPower()], power)
	if (setBonus > 0) then
		target:delMod(addedStat, setBonus)
	end
end