-----------------------------------
--
-- tpz.effect.LETHARGIC_DAZE_1
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.EVA, -effect:getPower())
	-- printf("lethargic_daze_1.lua onEffectGain TIER: [%i]  POWER: [%i]", effect:getTier(), effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.EVA, -effect:getPower())
end