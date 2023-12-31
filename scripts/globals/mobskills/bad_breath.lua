---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	if (mob:getID() == 17957301 or mob:getID() == 17957302) then
		mob:setVE(target, 0)
	end

    local dmgmod = MobBreathMove(mob, target, 0.25, 3, tpz.magic.ele.EARTH, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
	
	MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.POISON, mob:getMainLvl() / 10, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 0, 60)
	MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 15, 0, 60)
    
    return dmg
end