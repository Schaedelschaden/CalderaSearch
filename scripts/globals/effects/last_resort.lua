-----------------------------------
--
--     tpz.effect.LAST_RESORT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local subPower = effect:getSubPower()

    target:addMod(tpz.mod.ATTP, 25 + target:getMerit(tpz.merit.LAST_RESORT_EFFECT))
	target:addMod(tpz.mod.DEFP, -25 - target:getMerit(tpz.merit.LAST_RESORT_EFFECT) + target:getMod(tpz.mod.LAST_RESORT_DEF))
    target:addMod(tpz.mod.HASTE_ABILITY, target:getMod(tpz.mod.DESPERATE_BLOWS) + target:getMerit(tpz.merit.DESPERATE_BLOWS))
    target:addMod(tpz.mod.SUBTLE_BLOW, subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local subPower = effect:getSubPower()

    target:delMod(tpz.mod.ATTP, 25 + target:getMerit(tpz.merit.LAST_RESORT_EFFECT))
	target:delMod(tpz.mod.DEFP, -25 - target:getMerit(tpz.merit.LAST_RESORT_EFFECT) + target:getMod(tpz.mod.LAST_RESORT_DEF))
    target:delMod(tpz.mod.HASTE_ABILITY, target:getMod(tpz.mod.DESPERATE_BLOWS) + target:getMerit(tpz.merit.DESPERATE_BLOWS))
    target:delMod(tpz.mod.SUBTLE_BLOW, subPower)
end
