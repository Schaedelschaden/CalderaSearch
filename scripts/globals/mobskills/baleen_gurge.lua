---------------------------------------------------
-- Baleen Gurge
--
-- Description: Drains HP
-- Type: Magical (Dark)
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.5
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)

	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

    return dmg
end
