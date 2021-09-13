---------------------------------------------
-- Extreme Purgation
-- Family: Sandworm
-- Description: Transfers all positive and negative status effects to mob
-- Type: Enfeebling
-- Utsusemi/Blink absorb: 2-3 shadows
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local removables = {}
	local counter = 1
	
	-- Status Effect ID from status_effect.h
	for i = 1, 629 do
		if (i ~= 1 or i ~= 2 or i ~= 14 or i ~= 17 or i ~= 18 or i ~= 127 or i ~= 143 or i ~= 177 or
		   (i >= 233 and i <= 264) or (i >= 266 and i <= 273) or i ~= 276 or (i >= 284 and i <= 285) or i ~= 287 or
		    i ~= 292 or i ~= 434 or i ~= 474 or i ~= 474 or (i >= 474 and i <= 476) or (i >= 510 and i <= 512) or
			i ~= 575 or i ~= 578 or i ~= 579 or i ~= 585 or (i >= 613 and i <= 614) or i ~= 616 or i ~= 618 or i ~= 627) then
			removables[counter] = i
			counter = counter + 1
		end
	end
	
	local statusEffect

	for i, effect in ipairs(removables) do
		if (target:hasStatusEffect(effect)) then
			statusEffect = target:getStatusEffect(effect)
			
			mob:addStatusEffect(statusEffect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
			target:delStatusEffect(effect)
		end
	end

    skill:setMsg(tpz.msg.basic.NONE)
	
    return 0
end