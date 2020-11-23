-----------------------------------
--
-- tpz.effect.ASYLUM
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.MAGIC_EVASION_BOOST_II,1000)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.MAGIC_EVASION_BOOST_II,1000)
end