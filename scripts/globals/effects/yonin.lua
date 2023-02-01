-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect) --power=30 initially, subpower=30 for enmity
    target:addMod(tpz.mod.ACC, -effect:getPower())
    target:addMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:addMod(tpz.mod.ENMITY, effect:getSubPower())

    local yoninMerits = target:getMerit(tpz.merit.YONIN_EFFECT)

    if yoninMerits ~= 0 then
        target:addMod(tpz.mod.HP, yoninMerits)
    end
	
	-- local augYonin = target:getMod(tpz.mod.AUGMENT_YONIN)
	-- if (augYonin > 0) then
		-- target:addMod(tpz.mod.COUNTER, augYonin)
		-- target:setLocalVar("AUG_YONIN", augYonin)
	-- end
end

function onEffectTick(target, effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower() -1)
    target:delMod(tpz.mod.ACC, -1)
    target:delMod(tpz.mod.NINJA_TOOL, 1)
    effect:setSubPower(effect:getSubPower() - 1)
    target:delMod(tpz.mod.ENMITY, 1)
end

function onEffectLose(target, effect)
    --remove the remaining power
    target:delMod(tpz.mod.ACC, -effect:getPower())
    target:delMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:delMod(tpz.mod.ENMITY, effect:getSubPower())

    local yoninMerits = target:getMerit(tpz.merit.YONIN_EFFECT)

    if yoninMerits ~= 0 then
        target:delMod(tpz.mod.HP, yoninMerits)
    end
	
	-- if (target:getLocalVar("AUG_YONIN") > 0) then
		-- target:delMod(tpz.mod.COUNTER, target:getLocalVar("AUG_YONIN"))
		-- target:setLocalVar("AUG_YONIN", 0)
	-- end
end