-----------------------------------
--
-- tpz.effect.BRAZEN_RUSH
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DOUBLE_ATTACK,100)
end

function onEffectTick(target,effect)
   local power = effect:getPower()
   local decayby = 10
   -- Reduces effect by 10% each tick to a total benefit of +10% DA when the ability expires
   target:delMod(tpz.mod.DOUBLE_ATTACK,power)
   if (power > 0) then
      effect:setPower(power-decayby)
	  power = effect:getPower()
	  target:addMod(tpz.mod.DOUBLE_ATTACK,power)
   end
end

function onEffectLose(target,effect)
    local power = effect:getPower()
	target:delMod(tpz.mod.DOUBLE_ATTACK,power)
end
