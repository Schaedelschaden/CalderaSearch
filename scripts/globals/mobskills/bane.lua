---------------------------------------------
-- Bane
--
-- Description: Jinxes its victim with a horrible curse until it wears off or is removed.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 15'
-- Notes: Curse has a very long duration.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.CURSE_I
	local typeEffect2 = tpz.effect.WEIGHT

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 75, 0, 120))
	MobStatusEffectMove(mob, target, typeEffect2, 50, 0, 120)

    return typeEffect
end