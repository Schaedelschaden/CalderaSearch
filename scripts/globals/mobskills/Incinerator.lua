---------------------------------------------------
-- Incinerator
-- Deals Fire damage in an area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.BURN
	
	MobStatusEffectMove(mob, target, typeEffect1, 50, 0, 60)	
	
    local dmgmod = 2.8
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.6, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
