-----------------------------------
--
-- tpz.effect.SACROSANCTITY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.DMGMAGIC_II, -75)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.DMGMAGIC_II, -75)
	target:removeListener("SACROSANCTITY_TAKE_MAGIC")
end