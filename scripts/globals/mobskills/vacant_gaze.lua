---------------------------------------------
-- Vacant Gaze
-- Gaze dispel
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local effect = 0
	local counter = 0
	
    if (target:isFacing(mob)) then
		for i = 1, 3 do
		if (target:dispelStatusEffect()) then
			counter = counter + 1
		end

        if (effect == tpz.effect.NONE) then
            skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
        else
            skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        end
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    end

    return counter
end
