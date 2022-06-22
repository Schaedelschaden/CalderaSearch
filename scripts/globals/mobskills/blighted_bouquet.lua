---------------------------------------------
-- Blighted Bouquet
-- 15y AoE Damage, Bio, and Silence
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.BIO
	local typeEffect2 = tpz.effect.SILENCE
	
	MobStatusEffectMove(mob, target, typeEffect1, 100, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    return typeEffect
end