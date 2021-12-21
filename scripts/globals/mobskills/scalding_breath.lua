---------------------------------------------
--  Scalding Breath
--
--  Description: Conal Fire Damage (Breath) & inflicts Burn status
--  Type: Breath
--  Utsusemi/Blink absorb: Ignore shadows
--  Range: 12
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, tpz.magic.ele.FIRE, 600)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.BURN
    local power = 30

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    return dmg
end