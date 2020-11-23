-----------------------------------
--
-- tpz.effect.ASTRAL_FLOW
--
-----------------------------------

function onEffectGain(target,effect)
--	printf("Astral Flow onEffectGain TRIGGERED\n")
	target:recalculateAbilitiesTable()
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
    target:recalculateAbilitiesTable()
end
