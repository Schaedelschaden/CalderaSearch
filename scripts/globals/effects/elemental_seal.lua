-----------------------------------
--
--     tpz.effect.ELEMENTAL_SEAL
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
   target:addMod(tpz.mod.MACC, 256)
   target:addMod(tpz.mod.MAGIC_DAMAGE, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MACC, 256)
	target:delMod(tpz.mod.MAGIC_DAMAGE, effect:getPower())
end