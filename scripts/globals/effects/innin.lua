-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect) --power=30 initially, subpower=20 for enmity
    target:addMod(tpz.mod.EVA, -effect:getPower())
    target:addMod(tpz.mod.ENMITY, -effect:getSubPower())
	
	local augInnin = target:getMod(tpz.mod.AUGMENT_INNIN)
	if (augInnin > 0) then
		target:addMod(tpz.mod.DOUBLE_ATTACK, augInnin)
		target:setLocalVar("AUG_INNIN", augInnin)
	end
end

function onEffectTick(target, effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower() - 1)
    target:delMod(tpz.mod.EVA, - 1)
    if (effect:getPower() % 2 == 0) then -- enmity- decays from -20 to -10, so half as often as the rest.
        effect:setSubPower(effect:getSubPower() - 1)
        target:delMod(tpz.mod.ENMITY, -1)
    end
end

function onEffectLose(target, effect)
    --remove the remaining power
    target:delMod(tpz.mod.EVA, -effect:getPower())
    target:delMod(tpz.mod.ENMITY, -effect:getSubPower())
	
	if (target:getLocalVar("AUG_INNIN") > 0) then
		target:delMod(tpz.mod.DOUBLE_ATTACK, target:getLocalVar("AUG_INNIN"))
		target:setLocalVar("AUG_INNIN", 0)
	end
end