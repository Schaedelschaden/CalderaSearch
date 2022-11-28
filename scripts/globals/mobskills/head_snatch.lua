---------------------------------------------
--  Head Snatch
--  Description: Grabs a single target's head.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Only used by Gurfurlur the Menacing. Reduces HP to 10%.
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage    = currentHP * 0.9
    local dmg       = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
