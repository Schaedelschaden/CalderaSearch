---------------------------------------------
--  Blizzard Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Ice)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffectOne = tpz.effect.PARALYZE

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, tpz.magic.ele.ICE, 1100)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)

	MobStatusEffectMove(mob, target, typeEffectOne, 50, 0, 120)

	-- Handle Balaur's chance to gain Ice Spikes after using Blizzard Breath
	if (mob:getID() == 16839006 and mob:getHPP() <= 50 and math.random(1, 100) <= 33) then
		local power = 100
		local duration = 120
		mob:addStatusEffect(tpz.effect.ICE_SPIKES, power, 0, duration)
	end

    return dmg
end