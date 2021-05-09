---------------------------------------------
-- Granite Skin
--
-- Description: Enhances defense and guarding skill (nullifies all physical damage from the front).
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PHYSICAL_SHIELD

    skill:setMsg(MobBuffMove(mob, typeEffect, 10, 0, 60))

    return typeEffect
end
