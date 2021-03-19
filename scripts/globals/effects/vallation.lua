-----------------------------------
--
-- tpz.effect.VALLATION
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local sdtPower = {"Vallation_Fire", "Vallation_Ice", "Vallation_Wind", "Vallation_Earth", "Vallation_Lightning", "Vallation_Water", "Vallation_Light", "Vallation_Dark"}
local sdtMod = {tpz.mod.SDT_FIRE, tpz.mod.SDT_ICE, tpz.mod.SDT_WIND, tpz.mod.SDT_EARTH, tpz.mod.SDT_LIGHTNING, tpz.mod.SDT_WATER, tpz.mod.SDT_LIGHT, tpz.mod.SDT_DARK}

function onEffectGain(target, effect)
	for i = 1, 8 do
		if (target:getCharVar(sdtPower[i]) > 0) then
			local power = target:getCharVar(sdtPower[i])
			
			target:addMod(sdtMod[i], -power)
		end
	end
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	for i = 1, 8 do
		if (target:getCharVar(sdtPower[i]) > 0) then
			local power = target:getCharVar(sdtPower[i])
			
			target:delMod(sdtMod[i], -power)
			target:setCharVar(sdtPower[i], 0)
		end
	end
end