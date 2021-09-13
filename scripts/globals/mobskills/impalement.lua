---------------------------------------------
--  Impalement
--
--  Description: Impales a single target, leaving it near death. Additional effect: Slow + resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
		return 0
	end
	
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 0, 120)
	
    local currentHP = target:getHP()
    -- remove all by 5%
    local stab = currentHP * 0.95

    local dmg = MobFinalAdjustments(stab, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)

    mob:resetEnmity(target)
	
    return dmg
end