-----------------------------------
--
-- tpz.effect.GAMBIT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local PowerFire = target:getCharVar("Gambit_Fire")
	local PowerIce = target:getCharVar("Gambit_Ice")
	local PowerWind = target:getCharVar("Gambit_Wind")
	local PowerEarth = target:getCharVar("Gambit_Earth")
	local PowerLightning = target:getCharVar("Gambit_Lightning")
	local PowerWater = target:getCharVar("Gambit_Water")
	local PowerLight = target:getCharVar("Gambit_Light")
	local PowerDark = target:getCharVar("Gambit_Dark")
	
	if (PowerFire > 0) then
		target:delMod(tpz.mod.SDT_FIRE, PowerFire)
		target:setCharVar("Gambit_Fire", 0)
	end
	if (PowerIce > 0) then
		target:delMod(tpz.mod.SDT_ICE, PowerIce)
		target:setCharVar("Gambit_Ice", 0)
	end
	if (PowerWind > 0) then
		target:delMod(tpz.mod.SDT_WIND, PowerWind)
		target:setCharVar("Gambit_Wind", 0)
	end
	if (PowerEarth > 0) then
		target:delMod(tpz.mod.SDT_EARTH, PowerEarth)
		target:setCharVar("Gambit_Earth", 0)
	end
	if (PowerLightning > 0) then
		target:delMod(tpz.mod.SDT_LIGHTNING, PowerLightning)
		target:setCharVar("Gambit_Lightning", 0)
	end
	if (PowerWater > 0) then
		target:delMod(tpz.mod.SDT_WATER, PowerWater)
		target:setCharVar("Gambit_Water", 0)
	end
	if (PowerLight > 0) then
		target:delMod(tpz.mod.SDT_LIGHT, PowerLight)
		target:setCharVar("Gambit_Light", 0)
	end
	if (PowerDark > 0) then
		target:delMod(tpz.mod.SDT_DARK, PowerDark)
		target:setCharVar("Gambit_Dark", 0)
	end
end