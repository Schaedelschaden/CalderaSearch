---------------------------------------------
-- Immortal Mind
--
-- Description: Enhances magical attack and magical defense.
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
    local typeEffect1 = tpz.effect.MAGIC_ATK_BOOST
    local typeEffect2 = tpz.effect.MAGIC_DEF_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect1, 50, 0, 300))
    MobBuffMove(mob, typeEffect2, 50, 0, 300)

    return typeEffect1
end
