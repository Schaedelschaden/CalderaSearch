-----------------------------------
--
-- tpz.effect.PFLUG
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local PowerFire = target:getCharVar("Pflug_Fire")
	local PowerIce = target:getCharVar("Pflug_Ice")
	local PowerWind = target:getCharVar("Pflug_Wind")
	local PowerEarth = target:getCharVar("Pflug_Earth")
	local PowerLightning = target:getCharVar("Pflug_Lightning")
	local PowerWater = target:getCharVar("Pflug_Water")
	local PowerLight = target:getCharVar("Pflug_Light")
	local PowerDark = target:getCharVar("Pflug_Dark")
	
	-- printf("pflug.lua PARALYZE/BIND: [%i]  SILENCE/GRAVITY: [%i]  PETRIFY/SLOW: [%i]  STUN: [%i]  POISON/VIRUS: [%i]", PowerFire, PowerIce, PowerWind, PowerEarth, PowerLightning)
	-- printf("pflug.lua AMNESIA: [%i]  SLEEP/BLIND/CURSE: [%i]  CHARM/LULLABY/DEATH: [%i]", PowerWater, PowerLight, PowerDark)
	
	if (PowerFire > 0) then
		target:delMod(tpz.mod.PARALYZERES, PowerFire)
		target:delMod(tpz.mod.BINDRES, PowerFire)
		target:setCharVar("Pflug_Fire", 0)
	elseif (PowerIce > 0) then
		target:delMod(tpz.mod.SILENCERES, PowerIce)
		target:delMod(tpz.mod.GRAVITYRES, PowerIce)
		target:setCharVar("Pflug_Ice", 0)
	elseif (PowerWind > 0) then
		target:delMod(tpz.mod.PETRIFYRES, PowerWind)
		target:delMod(tpz.mod.SLOWRES, PowerWind)
		target:setCharVar("Pflug_Wind", 0)
	elseif (PowerEarth > 0) then
		target:delMod(tpz.mod.STUNRES, PowerEarth)
		target:setCharVar("Pflug_Earth", 0)
	elseif (PowerLightning > 0) then
		target:delMod(tpz.mod.POISONRES, PowerLightning)
		target:delMod(tpz.mod.VIRUSRES, PowerLightning)
		target:setCharVar("Pflug_Lightning", 0)
	elseif (PowerWater > 0) then
		target:delMod(tpz.mod.AMNESIARES, PowerWater)
		target:setCharVar("Pflug_Water", 0)
	elseif (PowerLight > 0) then
		target:delMod(tpz.mod.SLEEPRES, PowerLight)
		target:delMod(tpz.mod.BLINDRES, PowerLight)
		target:delMod(tpz.mod.CURSERES, PowerLight)
		target:setCharVar("Pflug_Light", 0)
	elseif (PowerDark > 0) then
		target:delMod(tpz.mod.CHARMRES, PowerDark)
		target:delMod(tpz.mod.LULLABYRES, PowerDark)
		target:delMod(tpz.mod.DEATHRES, PowerDark)
		target:setCharVar("Pflug_Dark", 0)
	end
end