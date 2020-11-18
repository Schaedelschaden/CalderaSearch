-----------------------------------
--
-- tpz.effect.LIEMENT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local PowerFire = target:getCharVar("Liement_Fire")
	local PowerIce = target:getCharVar("Liement_Ice")
	local PowerWind = target:getCharVar("Liement_Wind")
	local PowerEarth = target:getCharVar("Liement_Earth")
	local PowerLightning = target:getCharVar("Liement_Lightning")
	local PowerWater = target:getCharVar("Liement_Water")
	local PowerLight = target:getCharVar("Liement_Light")
	local PowerDark = target:getCharVar("Liement_Dark")
	
--	printf("liement.lua FIRE: [%i%%]  ICE: [%i%%]  WIND: [%i%%]  EARTH: [%i%%]  THUNDER: [%i%%]  WATER: [%i%%]  LIGHT: [%i%%]  DARK: [%i%%]", PowerFire, PowerIce, PowerWind, PowerEarth, PowerLightning, PowerWater, PowerLight, PowerDark)
	
	if (PowerFire > 0) then
		target:delMod(tpz.mod.FIRE_ABSORB, PowerFire)
		target:setCharVar("Liement_Fire", 0)
	end
	if (PowerIce > 0) then
		target:delMod(tpz.mod.ICE_ABSORB, PowerIce)
		target:setCharVar("Liement_Ice", 0)
	end
	if (PowerWind > 0) then
		target:delMod(tpz.mod.WIND_ABSORB, PowerWind)
		target:setCharVar("Liement_Wind", 0)
	end
	if (PowerEarth > 0) then
		target:delMod(tpz.mod.EARTH_ABSORB, PowerEarth)
		target:setCharVar("Liement_Earth", 0)
	end
	if (PowerLightning > 0) then
		target:delMod(tpz.mod.LTNG_ABSORB, PowerLightning)
		target:setCharVar("Liement_Lightning", 0)
	end
	if (PowerWater > 0) then
		target:delMod(tpz.mod.WATER_ABSORB, PowerWater)
		target:setCharVar("Liement_Water", 0)
	end
	if (PowerLight > 0) then
		target:delMod(tpz.mod.LIGHT_ABSORB, PowerLight)
		target:setCharVar("Liement_Light", 0)
	end
	if (PowerDark > 0) then
		target:delMod(tpz.mod.DARK_ABSORB, PowerDark)
		target:setCharVar("Liement_Dark", 0)
	end
end