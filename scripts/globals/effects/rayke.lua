-----------------------------------
--
-- tpz.effect.RAYKE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local resistPower = {"Rayke_Fire", "Rayke_Ice", "Rayke_Wind", "Rayke_Earth", "Rayke_Lightning", "Rayke_Water", "Rayke_Light", "Rayke_Dark"}
local resistMod = {tpz.mod.FIRERES, tpz.mod.ICERES, tpz.mod.WINDRES, tpz.mod.EARTHRES, tpz.mod.THUNDERRES, tpz.mod.WATERRES, tpz.mod.LIGHTRES, tpz.mod.DARKRES}

function onEffectGain(target, effect)
	for i = 1, 8 do
		if (target:getLocalVar(resistPower[i]) > 0) then
			local power = target:getLocalVar(resistPower[i])
			
			target:addMod(resistMod[i], -power)
		end
	end
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	for i = 1, 8 do
		if (target:getLocalVar(resistPower[i]) > 0) then
			local power = target:getLocalVar(resistPower[i])
			
			target:delMod(resistMod[i], -power)
			target:setLocalVar(resistPower[i], 0)
		end
	end
end