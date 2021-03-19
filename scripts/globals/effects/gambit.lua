-----------------------------------
--
-- tpz.effect.GAMBIT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local sdtPower = {"Gambit_Fire", "Gambit_Ice", "Gambit_Wind", "Gambit_Earth", "Gambit_Lightning", "Gambit_Water", "Gambit_Light", "Gambit_Dark"}
local sdtMod = {tpz.mod.SDT_FIRE, tpz.mod.SDT_ICE, tpz.mod.SDT_WIND, tpz.mod.SDT_EARTH, tpz.mod.SDT_LIGHTNING, tpz.mod.SDT_WATER, tpz.mod.SDT_LIGHT, tpz.mod.SDT_DARK}

function onEffectGain(target, effect)
	for i = 1, 8 do
		if (target:getLocalVar(sdtPower[i]) > 0) then
			local power = target:getLocalVar(sdtPower[i])
			
			target:addMod(sdtMod[i], power)
		end
	end
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	for i = 1, 8 do
		if (target:getLocalVar(sdtPower[i]) > 0) then
			local power = target:getLocalVar(sdtPower[i])
			
			target:delMod(sdtMod[i], power)
			target:setLocalVar(sdtPower[i], 0)
		end
	end
end