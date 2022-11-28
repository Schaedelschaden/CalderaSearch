---------------------------------------------
--  Hiemal Storm
--
--  Description: Extreme directional AoE ice damage for 200-1400 points
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Used only by Snoll Tzar
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.2, 1.25, tpz.magic.ele.ICE, 2000)

    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.9)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
