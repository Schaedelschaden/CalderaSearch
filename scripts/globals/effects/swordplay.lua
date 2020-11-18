-----------------------------------
--
-- tpz.effect.SWORDPLAY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, effect:getPower())
	target:addMod(tpz.mod.EVA, effect:getPower())
end

function onEffectTick(target, effect)
   local power = effect:getPower()
   local increase = 6 -- per tick

	if (power < 60) then
		effect:setPower(power + increase)
		target:addMod(tpz.mod.ACC, increase)
		target:addMod(tpz.mod.EVA, increase)
   end
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ACC, effect:getPower())
	target:delMod(tpz.mod.EVA, effect:getPower())
end