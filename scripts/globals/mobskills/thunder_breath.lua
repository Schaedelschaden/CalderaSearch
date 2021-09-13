---------------------------------------------
--  Thunder Breath
--
--  Description: Deals thunder damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Thunder)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if target:isInDynamis() or target:hasStatusEffect(tpz.effect.BATTLEFIELD)  then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffectOne = tpz.effect.STUN
	
	MobStatusEffectMove(mob, target, typeEffectOne, 1, 0, math.random(4, 6))

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, tpz.magic.ele.THUNDER, 1100)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)
	
	-- Handle Balaur's chance to gain Shock Spikes after using Thunder Breath
	if (mob:getID() == 16839006 and mob:getHPP() <= 50 and math.random(1, 100) <= 33) then
		local power = 100
		local duration = 120
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, power, 0, duration)
	end

    return dmg
end