---------------------------------------------------
-- Sacred Caper
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.BIO
    local typeEffect2 = tpz.effect.BLINDNESS
    local typeEffect3 = tpz.effect.TERROR
    
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 1, 3, 30)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 3, 30)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect3, 1, 3, 10)
    
    mob:resetEnmity(target)
    mob:addStatusEffect(tpz.effect.CHAINSPELL, 1, 0, 10)
    mob:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 30)

    local dmgmod = 1.0
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,tpz.magic.ele.WIND,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)

    return dmg
end