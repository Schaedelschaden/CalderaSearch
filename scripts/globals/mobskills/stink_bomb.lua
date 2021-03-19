---------------------------------------------------
--  Stink Bomb
--  Family: Snapweed
--  Description: Deals Earth elemental damage to enemies within area of effect. Duration of effect varies with TP.
--  Additional effects: Blind & Paralysis.
--  Type: Magical
--  Range: Radial
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.BLINDNESS
    local typeEffect2 = tpz.effect.PARALYSIS
    local duration = 120
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 150
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 180
	end

    MobStatusEffectMove(mob, target, typeEffect1, 20, 0, duration)
    MobStatusEffectMove(mob, target, typeEffect2, 20, 0, duration)

    local dmgmod = 1
    local baseDamage = mob:getWeaponDmg() * 4.2
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end