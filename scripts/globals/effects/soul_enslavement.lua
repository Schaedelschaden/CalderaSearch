-----------------------------------
--
-- tpz.effect.SOUL_ENSLAVEMENT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.ENSPELL, 22)
    target:addMod(tpz.mod.ENSPELL_DMG, 0)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
    target:setMod(tpz.mod.ENSPELL, 0)
	target:setMod(tpz.mod.ENSPELL_DMG, 0)
end
