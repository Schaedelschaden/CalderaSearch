-----------------------------------
--
-- tpz.effect.VALIANCE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local SDTFire = target:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = target:getMod(tpz.mod.SDT_ICE)
	local SDTWind = target:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = target:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = target:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = target:getMod(tpz.mod.SDT_WATER)
	local SDTLight = target:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = target:getMod(tpz.mod.SDT_DARK)
	
    target:delMod(tpz.mod.SDT_FIRE, SDTFire)
	target:delMod(tpz.mod.SDT_ICE, SDTIce)
	target:delMod(tpz.mod.SDT_WIND, SDTWind)
	target:delMod(tpz.mod.SDT_EARTH, SDTEarth)
	target:delMod(tpz.mod.SDT_LIGHTNING, SDTLightning)
	target:delMod(tpz.mod.SDT_WATER, SDTWater)
	target:delMod(tpz.mod.SDT_LIGHT, SDTLight)
	target:delMod(tpz.mod.SDT_DARK, SDTDark)
end