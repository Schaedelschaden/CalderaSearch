-----------------------------------
--
-- tpz.effect.RAYKE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local PowerFire = target:getCharVar("Rayke_Fire")
	local PowerIce = target:getCharVar("Rayke_Ice")
	local PowerWind = target:getCharVar("Rayke_Wind")
	local PowerEarth = target:getCharVar("Rayke_Earth")
	local PowerLightning = target:getCharVar("Rayke_Lightning")
	local PowerWater = target:getCharVar("Rayke_Water")
	local PowerLight = target:getCharVar("Rayke_Light")
	local PowerDark = target:getCharVar("Rayke_Dark")
	
	if (PowerFire > 0) then
		target:addMod(tpz.mod.FIRERES, PowerFire)
		target:setCharVar("Rayke_Fire", 0)
	end
	if (PowerIce > 0) then
		target:addMod(tpz.mod.ICERES, PowerIce)
		target:setCharVar("Rayke_Ice", 0)
	end
	if (PowerWind > 0) then
		target:addMod(tpz.mod.WINDRES, PowerWind)
		target:setCharVar("Rayke_Wind", 0)
	end
	if (PowerEarth > 0) then
		target:addMod(tpz.mod.EARTHRES, PowerEarth)
		target:setCharVar("Rayke_Earth", 0)
	end
	if (PowerLightning > 0) then
		target:addMod(tpz.mod.THUNDERRES, PowerLightning)
		target:setCharVar("Rayke_Lightning", 0)
	end
	if (PowerWater > 0) then
		target:addMod(tpz.mod.WATERRES, PowerWater)
		target:setCharVar("Rayke_Water", 0)
	end
	if (PowerLight > 0) then
		target:addMod(tpz.mod.LIGHTRES, PowerLight)
		target:setCharVar("Rayke_Light", 0)
	end
	if (PowerDark > 0) then
		target:addMod(tpz.mod.DARKRES, PowerDark)
		target:setCharVar("Rayke_Dark", 0)
	end
end