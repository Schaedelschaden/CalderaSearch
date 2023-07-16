-----------------------------------
--
-- tpz.effect.HYMNUS
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)

    target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
	if power > 3 then
		power = 3
	end

    target:delMod(bonusMod, empSetBonus)

    if target:getHP() <= 0 then
        target:sendReraise(power)
    end
end
