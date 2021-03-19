-----------------------------------
--
-- tpz.effect.LIEMENT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local absorbPower = {"Liement_Fire", "Liement_Ice", "Liement_Wind", "Liement_Earth", "Liement_Lightning", "Liement_Water", "Liement_Light", "Liement_Dark"}
local absorbMod = {tpz.mod.FIRE_ABSORB, tpz.mod.ICE_ABSORB, tpz.mod.WIND_ABSORB, tpz.mod.EARTH_ABSORB, tpz.mod.LTNG_ABSORB, tpz.mod.WATER_ABSORB, tpz.mod.LIGHT_ABSORB, tpz.mod.DARK_ABSORB}

function onEffectGain(target, effect)
	for i = 1, 8 do
		if (target:getCharVar(absorbPower[i]) > 0) then
			local power = target:getCharVar(absorbPower[i])
			
			target:addMod(absorbMod[i], power)
		end
	end
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	for i = 1, 8 do
		if (target:getCharVar(absorbPower[i]) > 0) then
			local power = target:getCharVar(absorbPower[i])
			
			target:delMod(absorbMod[i], power)
			target:setCharVar(absorbPower[i], 0)
		end
	end
end