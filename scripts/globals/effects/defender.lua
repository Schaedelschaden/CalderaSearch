-----------------------------------
--
-- tpz.effect.DEFENDER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	Gearflag = false
	target:addMod(tpz.mod.DEFP,25)
    target:addMod(tpz.mod.RATTP,-25)
    target:addMod(tpz.mod.ATTP,-25)
	if target:getEquipID(tpz.slot.HANDS) == 23532 then
		target:addMod(tpz.mod.SHIELDBLOCKRATE,15)
		Gearflag = true
	end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.DEFP,25)
    target:delMod(tpz.mod.ATTP,-25)
    target:delMod(tpz.mod.RATTP,-25)
	if Gearflag == true then
		target:delMod(tpz.mod.SHIELDBLOCKRATE,15)
		Gearflag = false
	end
end