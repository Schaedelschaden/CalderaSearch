-----------------------------------
--
--     tpz.effect.COPY_IMAGE
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    target:setMod(tpz.mod.UTSUSEMI, effect:getSubPower())
	
	if (target:getMod(tpz.mod.UTSU_ATK_SHADOWS > 0)) then
		local atkBonus = target:getMod(tpz.mod.UTSU_ATK_SHADOWS) * effect:getSubPower()
		target:addMod(tpz.mod.ATT, atkBonus)
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local atkBonus = target:getMod(tpz.mod.UTSU_ATK_SHADOWS) * effect:getSubPower()

    target:setMod(tpz.mod.UTSUSEMI, 0)
	target:delMod(tpz.mod.ATT, atkBonus)
end