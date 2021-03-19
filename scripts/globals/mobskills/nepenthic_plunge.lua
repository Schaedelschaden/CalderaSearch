---------------------------------------------------
--  Nepenthic Plunge
--  Family: Snapweed
--  Description: Deals Water elemental damage within a fan-shaped area. Duration of effect varies with TP.
--  Additional effects: Drown (-33 STR & 15 damage/tic) & Weight.
--  Type: Magical
--  Range: Conal
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
    local typeEffectOne = tpz.effect.DROWN
	local typeEffectTwo = tpz.effect.WEIGHT
    local duration = 60
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 90
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 120
	end

    MobStatusEffectMove(mob, target, typeEffectOne, 15, 0, duration)
	MobStatusEffectMove(mob, target, typeEffectTwo, 20, 0, duration)

    local dmgmod = 1.5
    local baseDamage = mob:getWeaponDmg() * 4.2
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end