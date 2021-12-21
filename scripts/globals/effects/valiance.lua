-----------------------------------
--
-- tpz.effect.VALIANCE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local sdtPower = {"Valiance_Fire", "Valiance_Ice", "Valiance_Wind", "Valiance_Earth", "Valiance_Lightning", "Valiance_Water", "Valiance_Light", "Valiance_Dark"}
local sdtMod = {tpz.mod.SDT_FIRE, tpz.mod.SDT_ICE, tpz.mod.SDT_WIND, tpz.mod.SDT_EARTH, tpz.mod.SDT_LIGHTNING, tpz.mod.SDT_WATER, tpz.mod.SDT_LIGHT, tpz.mod.SDT_DARK}

function onEffectGain(target, effect)
	for i = 1, 8 do
		if (target:getCharVar(sdtPower[i]) > 0) then
			local power = target:getCharVar(sdtPower[i])
			
			target:addMod(sdtMod[i], -power)
		end
	end
	
	if (target:getMainJob() == tpz.job.RUN and target:getMerit(tpz.merit.INSPIRATION) > 1) then
		target:addMod(tpz.mod.UFASTCAST, target:getMerit(tpz.merit.INSPIRATION))
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
	
	if (target:getMainJob() == tpz.job.RUN and target:getMerit(tpz.merit.INSPIRATION) > 1) then
		target:delMod(tpz.mod.UFASTCAST, target:getMerit(tpz.merit.INSPIRATION))
	end
end