---------------------------------------------------
-- Venom Shower
-- Damage players in an area of effect. Additional effect: Defense Down, Poison
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.POISON
	local typeEffect2 = tpz.effect.DEFENSE_DOWN

    MobStatusEffectMove(mob, target, typeEffect1, 75, 3, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 25, 3, 60)
	
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end