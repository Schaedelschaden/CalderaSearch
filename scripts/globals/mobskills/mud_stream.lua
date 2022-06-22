---------------------------------------------------
-- Mud Stream
-- Deals Earth damage in an area.
-- Additional effect: Magic Defense Down, Slow, Bind, Rasp (25 HP/tick)
-- Area of Effect is centered around caster.
-- Utsusemi/Blink absorb: Wipes shadows
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAGIC_DEF_DOWN
	local typeEffect2 = tpz.effect.SLOW
	local typeEffect3 = tpz.effect.BIND
	local typeEffect4 = tpz.effect.RASP

    MobStatusEffectMove(mob, target, typeEffect1, 10, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect2, 2920, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect3, 1, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect4, 25, 3, 120)

    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.5, tpz.magic.ele.EARTH, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
	
    return dmg
end