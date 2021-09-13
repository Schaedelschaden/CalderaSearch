---------------------------------------------
--  Chaos Breath
--
--  Description: Deals dark damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (dark)
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
	local typeEffectOne = tpz.effect.BLINDNESS
	
	MobStatusEffectMove(mob, target, typeEffectOne, 200, 0, 120)

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, tpz.magic.ele.DARK, 1100)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
	
	-- Handle Balaur's chance to gain Dread Spikes after using Chaos Breath
	if (mob:getID() == 16839006 and mob:getHPP() <= 50 and math.random(1, 100) <= 33) then
		local duration = 120
		local drainAmount = 10000
		mob:addStatusEffect(tpz.effect.DREAD_SPIKES, 0, 0, duration, 0, drainAmount, 1)
	end

    return dmg
end