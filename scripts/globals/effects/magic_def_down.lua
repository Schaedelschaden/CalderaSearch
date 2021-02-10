-----------------------------------
--
--	tpz.effect.MAGIC_DEF_DOWN
--
-----------------------------------

local magicSDT = {tpz.mod.SDT_FIRE, tpz.mod.SDT_ICE, tpz.mod.SDT_WIND, tpz.mod.SDT_EARTH, tpz.mod.SDT_LIGHTNING, tpz.mod.SDT_WATER, tpz.mod.SDT_LIGHT, tpz.mod.SDT_DARK}

function onEffectGain(target, effect)
	target:addMod(tpz.mod.MDEF, -effect:getPower())
	target:addMod(magicSDT[effect:getTier()], effect:getSubPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.MDEF, -effect:getPower())
	target:delMod(magicSDT[effect:getTier()], effect:getSubPower())
end