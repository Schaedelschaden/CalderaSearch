---------------------------------------------------
-- Righteous Rasp
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAGIC_DEF_DOWN
    local typeEffect2 = tpz.effect.DEFENSE_DOWN
    
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 1, 3, 30)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 3, 30)

    local dmgmod = 2.5
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,tpz.magic.ele.WIND,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)

    return dmg
end