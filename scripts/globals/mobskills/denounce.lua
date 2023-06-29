---------------------------------------------
--Denounce
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.25, 3, tpz.magic.ele.EARTH, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
	
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 0, 60)
	MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 100, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 100, 0, 60)
    
    mob:resetEnmity(target)
    
    if mob:AnimationSub() == 1 then
        dmg = target:getMaxHP() * 0.90
    end
    
    return dmg
end