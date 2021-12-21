-----------------------------------
--
-- tpz.effect.DEFENSE_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    if (effect:getPower() > 100) then
        effect:setPower(50)
    end
	
	local DEF = target:getMod(tpz.mod.DEF)
	local power = (effect:getPower() / 100)
	local conversion = DEF * power
	effect:setSubPower(conversion)
	
    target:addMod(tpz.mod.DEF, -conversion)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local conversion = effect:getSubPower()

    target:delMod(tpz.mod.DEF, -conversion)
end