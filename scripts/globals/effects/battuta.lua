-----------------------------------
--
-- tpz.effect.BATTUTA
-- 
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.PARRY_RATE_BONUS, effect:getPower() + effect:getSubPower())
	target:addMod(tpz.mod.COUNTER_DMG, effect:getSubPower() + target:getMod(tpz.mod.BATTUTA_EFFECT))
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.PARRY_RATE_BONUS, effect:getPower() + effect:getSubPower())
	target:delMod(tpz.mod.COUNTER_DMG, effect:getSubPower() + target:getMod(tpz.mod.BATTUTA_EFFECT))
end