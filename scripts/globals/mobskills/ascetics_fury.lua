---------------------------------------------
-- Ascetics Fury
-- Description: Hand To Hand Weapon Skill
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.6
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 20, 30, 50)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.H2H, info.hitslanded)

    return dmg
end
