---------------------------------------------
-- Providence
--
-- Description: Unlocks additional spells not normally available to a Poroggo.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Immediately attempts to cast Breakga, Slowga, Bindga, Blindga, Graviga, or Death
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PREPARATIONS
	local duration   = 30

    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, duration))

    return typeEffect
end
